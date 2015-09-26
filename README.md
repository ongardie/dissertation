# Consensus: Bridging Theory and Practice

This repository contains Diego Ongaro's PhD dissertation, *Consensus: Bridging
Theory and Practice*, published by Stanford University in 2014. The
dissertation PDFs and the dissertation sources are licensed under the Creative
Commons Attribution license, as described in the [LICENSE](LICENSE) file.

Several pre-built PDFs are included:

 - [book.pdf](book.pdf?raw=true): formatted for a printed book
   (8.5x11" pages, bigger inside margins for binding, black hyperlinks)
 - [online.pdf](online.pdf?raw=true): formatted for normal digital or print use
   (8.5x11" pages, consistent margins on all pages, blue hyperlinks)
 - [online-trim.pdf](online-trim.pdf?raw=true): formatted for digital viewing
   (6.6x9.35" pages, minimal margins, blue hyperlinks)
 - [stanford.pdf](stanford.pdf?raw=true): exact file distributed by
   Stanford University
   (similar to `online.pdf`; copyright, signature, and preface pages differ)

All of these use the same page numbers starting at page 1, though `book.pdf` has
an additional blank page before the introduction (page xviii).

The source materials for the dissertation are made available here in the hopes
that they might be useful, for example, to reformat the dissertation for a
different medium or to copy sections for use in other documents (per the
[LICENSE](LICENSE)). It requires the following to build:

 - GNU make
 - pdflatex
 - bibtex
 - Inkscape (to convert SVG images and layers from SVG images to PDF format)

## Updates and Errata

### Chapter 3: Basic Raft algorithm

- Figure 3.1 (cheatsheet): Although lastApplied is listed as volatile state, it should be as volatile as the state machine. If the state machine is volatile, lastApplied should be volatile. If the state machine is persistent, lastApplied should be just as persistent.

### Chapter 4: Cluster membership changes

- There's an **important bug** in single-server changes, fortunately with an easy fix. See the [raft-dev post](https://groups.google.com/d/msg/raft-dev/t4xj6dJTP6E/d2D9LrWRza8J).

### Chapter 7: Raft user study / Appendix A: User study materials

- "Log Completeness" should read "Leader Completeness" (3x).

### Chapter 8: Correctness / Appendix B: Safety proof and formal specification

- The Verdi team at the University of Washington has completed a machine-checked proof of safety for the basic Raft algorithm in Coq. See the [press release](https://news.cs.washington.edu/2015/08/07/uw-cses-verdi-team-completes-first-full-formal-verification-of-raft-consensus-protocol/).
- There have been a few minor updates to the TLA+ specification: <https://github.com/ongardie/raft.tla>.

### Chapter 10: Implementation and performance

- The first implementation of pipelining wasn't quite right and never made it into LogCabin's master branch. [Issue 97](https://github.com/logcabin/logcabin/issues/97) tracks this.

### Bibliography

- The Raft website has moved to <https://raft.github.io>.
