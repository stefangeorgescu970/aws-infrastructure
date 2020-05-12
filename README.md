
# Stefan's Personal AWS Infrastructure
This repository contains Terraform infrastructure as Code definitions for my personal AWS accounts.

# Repository Structure
All the subdirectories have their own README files with in depth explanation. The gist of it is the following:

 - **live** - stores the high level configuration of the three AWS accounts: development, staging and production;
 - **modules** - implementation of Terraform modules encapsulating blocks of infrastructure required for one software product;
 - **stacks** - Terraform modules built around a single AWS resource, implemented for reusability.

# Comments
If you have any questions regarding this implementation, do not hesitate to [contact me](mailto:contact@stefangeorgescu.com).
