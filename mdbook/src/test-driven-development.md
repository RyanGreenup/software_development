# Test Driven Development

## Introduction


Not all developers agree on the best way to write software. Some developers prefer to write tests before they write code, this is called Test Driven Development (TDD). The idea is that by writing tests first, you can ensure that your code is correct and that it works as expected. This can help you catch bugs early and avoid costly mistakes.

Test Driven deveopment is the idea of writing tests **before** one writes code. This way you can ensure that your code is correct and that it works as expected, it also ensures that you have a good test suite that you can run to catch bugs before making commits. Another advantage to this approach is it makes it easier to refactor your code, because you can run your tests to ensure that your changes haven't broken anything. Finally it allows you to use LLMs like Codestral and GPT4 to write the code for you, because you can run the tests to ensure that the code is correct [^1720954896].  LLMs can give back garbage, but they cut out a lot of repetition and boilerplate code and sometimes offer a stroke of insight and fresh perspective. I often ask an LLM to write code to pass a test and repeat the prompt at a high temperature in order to see the different ways the code could be written.

[^1720954896]: [cookbook/third_party/langchain/langgraph_code_assistant_mistral.ipynb at main · mistralai/cookbook](https://github.com/mistralai/cookbook/blob/main/third_party/langchain/langgraph_code_assistant_mistral.ipynb)


Not all developers agree on TDD, see generally [^1720954796], but all developers agree on the value of a good test suite. In this subject we will be encouraging TDD simply because it is a good habit to get into.

[^1720954796]: [site:reddit.com test driven deveopment at DuckDuckGo](https://lite.duckduckgo.com/lite/zzz/search?q=site%3Areddit.com%20test%20driven%20deveopment)



## Student Activities

The tutorials will map, one-to-one to your assessment, so make sure to finish them, they are not optional and your assessment will become a mere copy and paste job.

- Read The Test Driven Development Chapter from the Rust Book
- Read the Documentation for PyTest
- Use Test Driven Development to Write a CLI using Poetry [^1721354138] and Click [^1721354110] or Typer [^1721354115]
    - This CLI should use commands to parse a string and produce a plot using matplotlib (LLM / Google how to do this)
    - Create a Git Repo with the following:
        - One piece of documentation using `org-mode`
        - Produce an AI graphic for this project (use Stable Diffusion or DALL-E, seek guidance from the community e.g. [^1721354284]  [^1721354299] )
        - Use a Justfile [^1721354324] to automate the build process, refer to the documentation
        - Use obs [^1721354462] to record a video on the GitHub [^1721354510]
            - Use `ffmpeg` to convert this video to a `.gif` and include it in the README
                - Include the `ffmpeg` command in the Justfile
        - Ensure there is 100% test coverage
            - Write a piece of the documentation that describes whether complete test coverage is necessary and why
                - This is your opinion, there is no write answer. Some developers find complete test coverage cumbersome and unnecessary, others find it very useful.



[^1721354510]: If you're on Wayland, this is a PITA, use X11 for this, e.g. just use `i3` or `leftwm`
[^1721354462]: [obsproject/obs-studio: OBS Studio - Free and open source software for live streaming and screen recording](https://github.com/obsproject/obs-studio)
[^1721354324]: [justfile github at DuckDuckGo](https://lite.duckduckgo.com/lite/zzz/search?q=justfile%20github)
[^1721354299]: [AbdBarho/stable-diffusion-webui-docker: Easy Docker setup for Stable Diffusion with user-friendly UI](https://github.com/AbdBarho/stable-diffusion-webui-docker)
[^1721354284]: [You can now request Stable Diffusion generations from the AI Horde bot directly from anywhere in lemmy! - Divisions by zero](https://lemmy.dbzer0.com/post/13211160)
[^1721354138]: [python-poetry/poetry: Python packaging and dependency management made easy](https://github.com/python-poetry/poetry)
[^1721354115]: [tiangolo/typer: Typer, build great CLIs. Easy to code. Based on Python type hints.](https://github.com/tiangolo/typer)
[^1721354110]: [pallets/click: Python composable command line interface toolkit](https://github.com/pallets/click)

