## Contributing
When contributing to this repository, please adhere to the code of conduct below.

Here's the simplest way to contribute:
1. Fork [this repo](https://github.com/eleetyson/cli-blackjack) and create a clone of your fork (meaning, make a copy of these files that you can edit on your computer -- [Github's guide](https://docs.github.com/en/github/getting-started-with-github/fork-a-repo#propose-changes-to-someone-elses-project) explains the process much better than I can!)
2. Ensure you have Ruby and these two gems, "pry" and "httparty", installed on your computer
```
# Check all gems you have installed
gem list
# Check for a specific gem with a regex -- will return true if you've installed the gem already
gem list -i "^insert_gem_name$"
# Run the following lines, one at a time, to install "pry" and "httparty" gems
gem install pry
gem install httparty
```
3. Navigate to your newly cloned directory
4. Create a new branch for your changes / additions
`git checkout -b <topic-branch-name>`
5. Stage and commit your changes locally
```
git add .
git commit -m "succinct description goes here"
```
6. Open a pull request [here](https://github.com/eleetyson/cli-blackjack/pulls) (again, Github's [documentation](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/about-pull-requests) on how to do this is great)
### Contributor Covenant Code of Conduct
#### Our Pledge
In the interest of fostering an open and welcoming environment, we as contributors and maintainers pledge to making participation in our project and our community a harassment-free experience for everyone, regardless of age, body size, disability, ethnicity, gender identity and expression, level of experience, nationality, personal appearance, race, religion, or sexual identity and orientation.
#### Our Standards
Examples of behavior that contributes to creating a positive environment include:
* Using welcoming and inclusive language
* Being respectful of differing viewpoints and experiences
* Gracefully accepting constructive criticism
* Focusing on what is best for the community
* Showing empathy towards other community members

Examples of unacceptable behavior by participants include:
* The use of sexualized language or imagery and unwelcome sexual attention or advances
* Trolling, insulting/derogatory comments, and personal or political attacks
* Public or private harassment
* Publishing others' private information, such as a physical or electronic address, without explicit permission
* Other conduct which could reasonably be considered inappropriate in a professional setting
#### Our Responsibilities
Project maintainers are responsible for clarifying the standards of acceptable behavior and are expected to take appropriate and fair corrective action in response to any instances of unacceptable behavior.

Project maintainers have the right and responsibility to remove, edit, or reject comments, commits, code, wiki edits, issues, and other contributions that are not aligned to this Code of Conduct, or to ban temporarily or permanently any contributor for other behaviors that they deem inappropriate, threatening, offensive, or harmful.
#### Scope
This Code of Conduct applies both within project spaces and in public spaces when an individual is representing the project or its community. Examples of representing a project or community include using an official project e-mail address, posting via an official social media account, or acting as an appointed representative at an online or offline event. Representation of a project may be further defined and clarified by project maintainers.
#### Enforcement
Instances of abusive, harassing, or otherwise unacceptable behavior may be reported by contacting me at [eleetyson@gmail.com](mailto:eleetyson@gmail.com). All complaints will be reviewed and investigated and will result in a response that is deemed necessary and appropriate to the circumstances. The project team is obligated to maintain confidentiality with regard to the reporter of an incident. Further details of specific enforcement policies may be posted separately.

Project maintainers who do not follow or enforce the Code of Conduct in good faith may face temporary or permanent repercussions as determined by other members of the project's leadership.
#### Attribution
This Code of Conduct is adapted from the [Contributor Covenant](https://www.contributor-covenant.org/), version 1.4, available [here](https://www.contributor-covenant.org/version/1/4/code-of-conduct/).