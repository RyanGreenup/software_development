# Test Driven Development

Not all developers agree on the best way to write software. Some developers prefer to write tests before they write code, this is called Test Driven Development (TDD). The idea is that by writing tests first, you can ensure that your code is correct and that it works as expected. This can help you catch bugs early and avoid costly mistakes.

Test Driven deveopment is the idea of writing tests **before** one writes code. This way you can ensure that your code is correct and that it works as expected, it also ensures that you have a good test suite that you can run to catch bugs before making commits. Another advantage to this approach is it makes it easier to refactor your code, because you can run your tests to ensure that your changes haven't broken anything. Finally it allows you to use LLMs like Codestral and GPT4 to write the code for you, because you can run the tests to ensure that the code is correct [^1720954896].  LLMs can give back garbage, but they cut out a lot of repetition and boilerplate code and sometimes offer a stroke of insight and fresh perspective. I often ask an LLM to write code to pass a test and repeat the prompt at a high temperature in order to see the different ways the code could be written.

[^1720954896]: [cookbook/third_party/langchain/langgraph_code_assistant_mistral.ipynb at main · mistralai/cookbook](https://github.com/mistralai/cookbook/blob/main/third_party/langchain/langgraph_code_assistant_mistral.ipynb)


Not all developers agree on TDD, see generally [^1720954796], but all developers agree on the value of a good test suite. In this subject we will be encouraging TDD simply because it is a good habit to get into.

[^1720954796]: [site:reddit.com test driven deveopment at DuckDuckGo](https://lite.duckduckgo.com/lite/zzz/search?q=site%3Areddit.com%20test%20driven%20deveopment)




