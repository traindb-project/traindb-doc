# How to Write GitBook Docs

This documentation site you are looking at is built using GitBook.
This section describes how to install the required packages required and how to update our documentation.

## Setup

First, it is required to install Node.js, which is used in the GitBook package.

```console
(Ubuntu) $ sudo apt-get install nodejs
(MacOS)  $ brew install nodejs
```

Next, install GitBook's command line interface using npm as follows.

```console
$ npm install gitbook-cli@2.1.2 --global
$ gitbook --version
```

Finally, clone our ```traindb-doc``` repository.

```console
git clone https://github.com/traindb-project/traindb-doc.git
```

## Documentation

Our documents are written in the markdown format.
* [Markdown syntax](https://docs.gitbook.com/editing-content/markdown)

Note that if a new document file is added, the entire table of contents in ```SUMMARY.md``` and the table of contents in the corresponding chapter must also be updated.

If you have revised documents, run the following command to check whether it was written correctly in local machine.
After running the command, you can preview them at http://localhost:4000.

```console
$ gitbook serve
```

## Commit

When you have finished editing the documentation, run the script file below to build the web pages of our documentation site.
This script builds and integrates documentation sites for each version.

```console
$ ./build-update.sh
```

Now you can add all the changed files and commit them.
