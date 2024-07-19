# GUI Development

## Student Activities

### Immediate Mode GUIs

Use EGUI to create a simulator of the following function:

$$
X_t - \sum_{i=1}^{2} \phi_i X_{t-i} = \varepsilon_t + \sum_{j=1}^{2} \theta_j \varepsilon_{t-j}
$$



Where:
- $X_t$ is the observed value at time t,
- $\varepsilon_t \sim \mathcal{N}(0,\sigma)$ are Random Normal values, i.e. the white noise error term at time t,
- $\phi = [\phi_1, \phi_2]^T$ is the vector of autoregressive coefficients, and
- $\theta = [1, \theta_1, \theta_2]^T$ is the vector of moving average coefficients.


For example, in Python this would be represented as such:

```python
def arma_2_2(phi, theta, X_past, varepsilon_past):
    # calculate AR part of equation
    ar_part = -phi[0] * X_past[-1] - phi[1] * X_past[-2]
    # calculate MA part of equation
    ma_part = varepsilon_past[-1] + theta[0] * varepsilon_past[-2] + theta[1] * varepsilon_past[-3]
    # add AR and MA parts to get X_t
    return ar_part + ma_part
```

To get you started, the `cargo.toml` file should look like this:

```toml
[package]
name = "My Arima Simulator"
version = "0.1.0"
edition = "2024"

[build]
target = "x86_64-unknown-linux-musl"

[dependencies]
egui="*"
eframe="*"
ndarray = "*"
num = "*"
rand = "0.8.5"
rand_distr = "0.4.3"
```

White noise can be generated something like this:

```rust
use eframe::egui;
use egui::plot::{Line, Plot, PlotPoints};
use rand_distr::Distribution;

struct ArimaSimulator {
    res: usize,
    sd: f64,
    wn: Vec<f64>,
}

impl ArimaSimulator {
    fn new(res: usize, sd: f64) -> Self {
        let mut rng = rand::thread_rng();
        let normal = rand_distr::Normal::new(0.0, sd).unwrap();
        let wn = (0..res).map(|_| normal.sample(&mut rng)).collect();
        Self { res, sd, wn }
    }
}
```

And a basic starting point could be:


Classes and imports


```rust
// NOTE https://github.com/emilk/egui
// NOTE https://docs.rs/egui/latest/egui/widgets/plot/struct.Plot.html
#![cfg_attr(not(debug_assertions), windows_subsystem = "windows")] // hide console window on Windows in release

// use std::f64::consts::PI;
// use eframe::{egui, emath::Numeric};
// use egui::plot::BarChart;
use eframe::egui;
use egui::plot::{Line, Plot, PlotPoints};
use rand_distr::Distribution;


struct MyApp {
    start: f64,
    end: f64,
    phase: f64,
    n: i32,
    intercept: f64,
    amp: f64,
}

impl Default for MyApp {
    fn default() -> Self {
        Self {
            start: 0.0,
            end: 10.0,
            n: 1,
            intercept: 0.0,
            amp: 1.0,
            phase: 0.0,
        }
    }
}

```

Plotting in egui takes a list of tupples rather than two lists, so we need to zip the two lists together:

```rust
/// Convert a vector into a vector of tupples
/// This is useful for plotting
/// Example:
/// ```
/// let x1: Vec<f64> = (0..10).map(|x| x as f64).collect();
/// let y1: Vec<f64> = (0..10).map(|x| x as f64).collect();
/// let xy1 = vector_to_tupples(x1, y1);
/// ```
/// Input: [1, 2, 3], ["a", "b", "c"]
/// Output: [[1, "a"], [2, "b"], [3, "c"]]
fn vector_to_tupples(y1: Vec<f64>) -> Vec<[f64; 2]> {
    (1..y1.len())
        .zip(y1.iter())
        .map(|(a, b)| {
            let a = a as f64;
            [a.clone(), b.clone()]
        })
        .collect()
}

```

Then finally a basic plot can be created like this:

```rust
fn main() {
    let options = eframe::NativeOptions::default();
    eframe::run_native(
        "My egui App",
        options,
        Box::new(|_cc| Box::new(MyApp::default())),
    );
}

impl eframe::App for MyApp {
    fn update(&mut self, ctx: &egui::Context, _frame: &mut eframe::Frame) {
        egui::SidePanel::left("Left Panel").show(ctx, |ui| {
            // a scrollable area
            egui::ScrollArea::vertical().show(ui, |ui| {
                // A slider for the Parameters
                ui.add(egui::Slider::new(&mut self.phase, -10.0..=10.0).text("Phase"));
                ui.add(egui::Slider::new(&mut self.intercept, -10.0..=10.0).text("Intercept"));
                ui.add(egui::Slider::new(&mut self.amp, -10.0..=10.0).text("Amplitude"));

                // TODO add a toggle for additional ar parameters
            });
        });

        egui::CentralPanel::default().show(ctx, |ui| {
            egui::ScrollArea::vertical().show(ui, |ui| {
                // Make some vectors to plot
                let x1: Vec<f64> = (0..self.n)
                    .map(|x| (x as f64) * (self.end as f64))
                    .collect();
                let mut y1 = x1.clone();
                // A map would be better, this is for illustration
                for i in 3..x1.len() {
                    // y1 is cloned noise, no need to add it back
                    y1[i] = (y1[i] + self.phase).sin() * self.amp + self.intercept;
                }

                // Transform the Vectors into a vector of x,y tupples
                let x0 = vector_to_tupples(x1.clone());
                let x1 = vector_to_tupples(x1);

                // Cast into: egui::widgets::plot::items::values::PlotPoints
                let p1: PlotPoints = x0.into();
                let p2: PlotPoints = x1.into();

                // Make a line
                let line1 = Line::new(p1);
                let line2 = Line::new(p2);

                // Plot the values
                Plot::new("Both Errors")
                    .view_aspect(2.0)
                    .show(ui, |plot_ui| {
                        plot_ui.line(line1.color(egui::Color32::RED));
                        plot_ui.line(line2.color(egui::Color32::BLUE));
                    });
                // Add a legend
                ui.vertical(|ui| {
                    // coloured label
                    ui.colored_label(egui::Color32::RED, "1. RED:  First  Argument");
                    ui.colored_label(egui::Color32::BLUE, "2. BLUE: Second Argument");
                });
            });
        });
    }
}
```


### Stateful GUIs

Repeat that above Exercise using PySide 6.

Working with PyQt6 is a little more complex than working with EGUI, but it is well worth having familiarity with both.

Here you are given an example of PyQt6 GUI and you are required to modify it to produce a model of a sine wave that can:


- Scale the Amplitude
- Slide the Phase
- Slide the intercept

Here is the starting point:


```python

#!/usr/bin/env python
# see https://www.pythonguis.com/tutorials/pyqt6-plotting-matplotlib/
import sys
import matplotlib
import numpy as np

matplotlib.use("QtAgg")

from PyQt6 import QtCore, QtGui, QtWidgets

from matplotlib.backends.backend_qt5agg import (
    FigureCanvasQTAgg,
    NavigationToolbar2QT as NavigationToolbar,
)
from matplotlib.figure import Figure


class MplCanvas(FigureCanvasQTAgg):
    def __init__(self, parent=None, width=5, height=4, dpi=100):
        fig = Figure(figsize=(width, height), dpi=dpi)
        self.axes = fig.add_subplot(111)
        super(MplCanvas, self).__init__(fig)


class MainWindow(QtWidgets.QMainWindow):
    def __init__(self, *args, **kwargs):
        self.m = 1
        self.n = 100
        super(MainWindow, self).__init__(*args, **kwargs)

        self.sc = MplCanvas(self, width=5, height=4, dpi=100)
        t = np.linspace(start=0, stop=1, num=100)
        y = t**self.m
        self.sc.axes.plot(t, y)
        self.sc.axes.set_title(f"y = {self.m} Bt + a_t")
        # sc.axes.plot([0, 1, 2, 3, 4], [10, 1, 20, 3, 40])

        # Create toolbar, passing canvas as first parament,
        # parent (self, the MainWindow) as second.
        toolbar = NavigationToolbar(self.sc, self)

        layout = QtWidgets.QVBoxLayout()
        layout.addWidget(toolbar)
        layout.addWidget(self.sc)

        h = QtWidgets.QHBoxLayout()
        h.addWidget(QtWidgets.QPushButton("Plot"))
        h.addWidget(QtWidgets.QPushButton("Other"))

        # Add slider
        self.slider = QtWidgets.QSlider(QtCore.Qt.Orientation.Horizontal)
        self.slider.setRange(-200, 200)
        self.slider.setSingleStep(1)
        self.slider.setValue(0)
        self.slider.valueChanged.connect(self.slider_change)

        # Print the slider value on th eplot

        h.addWidget(self.slider)
        layout.addLayout(h)

        # set m to the value of the slider
        self.set_slider_value()

        # Create a placeholder widget to hold our toolbar and canvas.
        widget = QtWidgets.QWidget()
        widget.setLayout(layout)
        self.setCentralWidget(widget)

        self.show()


    def get_slider_value(self) -> float:
        return self.slider.value() / 100

    def set_slider_value(self):
        # set m to the value of the slider
        # which is between -2 and 2
        # slider takes ints so divide by 100
        self.m = self.get_slider_value()

    def slider_change(self, value):
        self.set_slider_value()
        self.update_plot(self.m)

    def update_plot(self, value):
        try:
            self.sc.axes.clear()  # Clear the old plot
        except Exception:
            pass # TODO error handling

        x = np.linspace(0, 4 * np.pi, self.n)

        # Simulate an arima process
        theta = self.m
        y = np.zeros(self.n)
        for i in range(1,self.n):
            y[i] = theta * y[i-1] + np.random.normal()

        self.sc.axes.plot(x, y)  # Plot the new AR1 process
        self.sc.axes.set_title(f"y = {self.m} Bt + a_t")
        self.sc.draw()  # Redraw the canvas


class functions:
    def __init__(self, phiv, thetav, psiv):
        self.phi = phiv
        self.theta = thetav
        self.psiv = psiv

    def linear(self, n: int) -> tuple[np.ndarray, np.ndarray]:
        t = np.linspace(start=0, stop=1, num=n)
        y = np.linspace(start=0, stop=0, num=n)

        for i in range(n):
            t[i] = self.phi * i / n

        return t, y


app = QtWidgets.QApplication(sys.argv)
w = MainWindow()
app.exec()
```

