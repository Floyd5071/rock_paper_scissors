# README

## Raising up rock_paper_scissors application

### Using docker

1. Install Docker into your system by downloading a package from the official website or by using a package manager for your system (i.e. Homebrew)
2. Start Docker and proceed with initial setup
3. Open terminal, go to the project dir and execute these commands:
```
docker build . -t rubyapp
docker-compose up -d
```
4. Done. API is up and running

---

### How to use this APP

1. Open your browser
2. Put this url to your browser: http://127.0.0.1:3000/api/v1/user_space/games/play?turn={{user_turn}}, where {{user_turn}} must be in [rock, paper, scissors]
3. Enjoy it;)
