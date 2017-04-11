---
title: "Art Tracks Software"
hero_image: "CMA-71-4_1.jpg"
hero_image_credit: "Nicola di Maestro Antonio D’Ancona, *Madonna and Child Enthroned with SS. Leonard, Jerome, John the Baptist, and Francis* (detail), 1472. Carnegie Museum of Art, Howard A. Noble Fund, 71.4."
hero_image_url: "http://www.cmoa.org/CollectionDetail.aspx?item=1016222"
---

# Software

Over the course of the Art Tracks Project, we have developed a set of libraries and tools for managing provenance within a museum ecosystem.  This page lists the various tools available.

In general, these tools are built using the Ruby and JavaScript programming languages.  All tools are licensed under the [MIT license](https://opensource.org/licenses/MIT) unless otherwise specified.  This means that they can be used for free in both commercial and non-commercial projects.[^1]

##List of Tools

[**museum_provenance**](https://github.com/arttracks/museum_provenance)  

* Current Version: **0.1.1**
* Language:  **Ruby**
* Source Code: **<https://github.com/arttracks/museum_provenance>**
* Documentation: **<http://arttracks.github.io/museum_provenance/frames.html>**

This library is the core technology developed for this project.  It takes provenance records and converts them into structured, well-formatted data.  



The [**Elysa**](https://github.com/cmoa/elysa) tool is a user interface designed for museum professionals.  It assists with verifying, cleaning, and modifying provenance records. 

An initial [**Prototype**](https://github.com/arttracks/provenance-interactive) of a in-gallery interactive was created in Spring 2015 to research ways to present detailed provenance information to the public.  Much of the work here will inform the upcoming 2017 Northbrook Initiative gallery experience.


[^1]: All software written by the Art Tracks team is MIT licensed, however it may use other open-source libraries with other licenses, and it's probably worth checking if those meet your requirements if you're interested in integrating Art Tracks into a commercial project.   To the best of our knowledge, all used libraries are completely free and open for use by individuals and institutions who are not actively modifying and selling the software without sharing contributions.
