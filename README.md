![IDCN TMP Logo](https://raw.githubusercontent.com/IDCN/talent-management-platform/master/docs/_static/img/IDCNTMP_2.png)

--------------------------------------------------------------------------------

IDCN Talent Management Platform is a collection of R scripts that wrangle and visualize an IDCN chapter's membership database.

<h3>Contents</h3>

- [More about IDCN TMP](#more-about-idcn-tmp)
- [Getting Started](#getting-started)
- [Organization and Communication](#organization-and-communication)
- [Contributing](#contributing)
- [People](#people)

--------------------------------------------------------------------------------

## More about IDCN TMP

In more detail, IDCN TMP consists of the following scripts:

| Script | Description |
| ---- | --- |
| **MonthlyReport.R** | provides various counts and charts of active and inactive members |
| **TDP.R** | plots desired job placement outcomes of active members |
| **extractTMP.R** | loads into R a local copy of a membership database |
| **installLibraries.R** | lists package dependencies, some of which may require manual installation with a package manager |
| **loadThemes.R** | contains themes and color palettes for various plots |
| **getSubtables.R** | constructs .xlsx files of interest to volunteer teams |
| **transformandplotTMP.R** | prepares the TMP for plotting for the Targeted Demographics Report|
| **constructGraphs.R** | constructs plots for the Targeted Demographics Report |


## Getting Started

To test code locally and to produce charts, it is recommended that you download R and RStudio. Alternatively, there are resources that compile R code online, such as https://rdrr.io/snippets/.

If you have never programmed with R, check the following resources:
- Installing R: https://www.r-project.org/
- Installing RStudio: https://www.rstudio.com/
- Installing dependencies: https://github.com/IDCN/talent-management-platform/blob/master/installLibraries.R

R's installation behavior is platform dependent. An installation on MacOS may not be the same as an installation on Windows or Linux. If you run into issues with an installation, a good resource for finding solutions is <a href="https://stackoverflow.com/">StackOverflow</a>, which is one of the most important programming resources on the Internet.

## Organization and Communication

If an IDCN chapter decides to participate in the IDCN TMP project, it is recommended that a volunteer who has access to SINCRON be dedicated to the project. In particular, IDCN Copenhagen's Membership Team is composed of at least one person with SINCRON access whose responsibilities include maintaining and extending the IDCN TMP code.

Any communication regarding technical issues that relate to the project (such as bug reports, feature requests, installation difficulties, etc.) should be done in <a href="https://github.com/IDCN/talent-management-platform/issues">IDCN TMP's Issues Page</a>.

General discussion about all things that relate to IDCN TMP or to the application of data science in general to IDCN initiatives should be held at https://idcn-github.slack.com/.

## Contributing

We appreciate all contributions. Especially of note is that it is not necessary to have programming experience to contribute. (No programming experience is needed to request a new feature!) If you are planning to contribute back bug-fixes, please do so without any further discussion.

If you plan to contribute new features, utility functions or extensions to the core, please first open an issue and discuss the feature with us. Absent a discussion, a pull request is very likely to be rejected.

For more details, please refer to <a href="https://github.com/IDCN/talent-management-platform/blob/master/CONTRIBUTING.md">Contributing to IDCN's Talent Management Platform</a>.

## People
IDCN TMP is an open source project driven by IDCN volunteers who want to construct data science tools to help the International Dual Career Network understand its membership and conduct its affairs efficiently.

IDCN TMP is currently maintained by Jon Middleton and Jamile Queiroz de Sousa.
