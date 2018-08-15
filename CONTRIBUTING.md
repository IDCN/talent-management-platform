<h1>Contributing to IDCN's Talent Management Platform</h1>

The following is a set of guidelines for contributing to the code base for wrangling, analyzing, and visualizing the local membership databases of IDCN's Talent Management Platform. These are guidelines, not rules. Accordingly, feel free to propose changes to this document in a pull request.

<h2>Purpose</h2>

The code base was written originally to pull demographic information from IDCN Copenhagen's membership database for the purpose of understanding where members wanted to go in the Danish economy. Copenhagen's Membership Team then realized that the code base could be used to expedite its Monthly Report on the status of the membership, as well as to generate quickly various spreadsheets of interest to other teams.

We now envision this project as an opportunity for IDCN members who are interested in data science to learn the R programming langugage in a practical business setting, as well as a chance for those who plan to enter data science to contribute to a useful open source project and thus bolster a data science portfolio. To that end, much of the code is heavily commented, so that new practitioners can treat it as a tutorial for data wrangling, data analysis, and data visualization.

This project has enormous potential for expansion, and we strongly encourage ideas for extending functionality, speeding production, and improving visualization.

<h2>Getting Started</h2>

If you are interested in contributing to IDCN's Talent Mangagement Platform, your contributions will fall into three categories:
1. You want to propose a new feature.
    - First check the outstanding issues here: https://github.com/IDCN/talent-management-platform/issues.
    - Post your new feature for a discussion of its design and implementation.
2. You want to implement either a feature or a bug-fix.
    - Look at the Low Priority and Medium Priority issues.
    - Choose an issue and comment on the task that you want to work on this feature.
    - Ask if you need more context on a particular issue.
3. You want to write documentation.
    - Post your ideas for documentation as an issue.

After implementing a feature/bug-fix or writing documentation, send a Pull Request to https://github.com/IDCN/talent-management-platform/.

If you are unfamiliar with creating a Pull Request, here are some guides:
- http://stackoverflow.com/questions/14680711/how-to-do-a-github-pull-request
- https://help.github.com/articles/creating-a-pull-request/

If you have never programmed with R, check the following resources:
- Installing R: https://www.r-project.org/
- Installing RStudio: https://www.rstudio.com/
- Installing dependencies: https://github.com/IDCN/talent-management-platform/blob/master/installLibraries.R

<h2>Targeted Demographics Project</h2>
The Targeted Demographics Project summarizes the desired job placement outcomes of active local members for IDCN's Targeted Demographics Report. It wrangles a local membership database to produce bar charts of desired job placement outcomes in a local economy.

<h2>Monthly Report</h2>
The Monthly Report gives information about the current state of a chapter's membership. It includes counts of active and inactive members, gives accounts of former and current volunteers, and tracks the job placement outcomes of inactive members. This requires the reporter to conduct many counts of various subsets of the membership, all of which are automated by the R scripts.
