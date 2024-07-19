# Implementation: Writing a CLI in Python and Rust


## Student Assignment

### Writing Software


- Use Test Driven Development to Write a CLI using either python or Rust.
    - If you are using Rust:
       - Poetry and Clap
    - If you are using Python:
        - Poetry [^1721354138] and Click [^1721354110] or Typer [^1721354115]
    - This CLI should use commands to acheive one of the following:
        - A bookmarks application that stores data in SQLite, Json or YAML
        - A CLI chatbot using llamma.cpp [^1721354768] and phi3-mini [^1721354787] or StableLM [^1721354840] that provides feedback on code that is in the clipboard
            - The code should be injected into the chat from the clipboard
        - A search engine that uses mxbai to implement search [^1721354908] and produces a PCA visualization of that space [^1721354926]
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



### Collaborating on Software Development

Identify a feature or bug in another students code, submit a pull request to fix it. This will be assessed as part of your final grade.


[^1721354110]: [pallets/click: Python composable command line interface toolkit](https://github.com/pallets/click)
[^1721354115]: [tiangolo/typer: Typer, build great CLIs. Easy to code. Based on Python type hints.](https://github.com/tiangolo/typer)
[^1721354138]: [python-poetry/poetry: Python packaging and dependency management made easy](https://github.com/python-poetry/poetry)
[^1721354284]: [You can now request Stable Diffusion generations from the AI Horde bot directly from anywhere in lemmy! - Divisions by zero](https://lemmy.dbzer0.com/post/13211160)
[^1721354299]: [AbdBarho/stable-diffusion-webui-docker: Easy Docker setup for Stable Diffusion with user-friendly UI](https://github.com/AbdBarho/stable-diffusion-webui-docker)
[^1721354324]: [justfile github at DuckDuckGo](https://lite.duckduckgo.com/lite/zzz/search?q=justfile%20github)
[^1721354462]: [obsproject/obs-studio: OBS Studio - Free and open source software for live streaming and screen recording](https://github.com/obsproject/obs-studio)
[^1721354510]: If you're on Wayland, this is a PITA, use X11 for this, e.g. just use `i3` or `leftwm`
[^1721354768]: [ggerganov/llama.cpp: LLM inference in C/C++](https://github.com/ggerganov/llama.cpp)
[^1721354787]: [Phi-3](https://huggingface.co/docs/transformers/main/model_doc/phi3)
[^1721354840]: [Stable Code 3B: Coding on the Edge — Stability AI](https://stability.ai/news/stable-code-2024-llm-code-completion-release)
[^1721354908]: [mixedbread-ai/mxbai-embed-large-v1 · Hugging Face](https://huggingface.co/mixedbread-ai/mxbai-embed-large-v1)
[^1721354926]: Your tutor and GPT4 can help you with this, you are not expected to understand all the mathematics here, merely implement the code.
