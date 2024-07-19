# Implementation: Writing a CLI in Python and Rust


## Student Assignment


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




[^1721354768]: [ggerganov/llama.cpp: LLM inference in C/C++](https://github.com/ggerganov/llama.cpp)
[^1721354787]: [Phi-3](https://huggingface.co/docs/transformers/main/model_doc/phi3)
[^1721354840]: [Stable Code 3B: Coding on the Edge — Stability AI](https://stability.ai/news/stable-code-2024-llm-code-completion-release)
[^1721354908]: [mixedbread-ai/mxbai-embed-large-v1 · Hugging Face](https://huggingface.co/mixedbread-ai/mxbai-embed-large-v1)
[^1721354926]: Your tutor and GPT4 can help you with this, you are not expected to understand all the mathematics here, merely implement the code.
