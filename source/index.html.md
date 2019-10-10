---
title: "Art Tracks"
hero_image: "picking_fruit.jpg"
hero_image_credit: "Mary Cassatt, *Young Women Picking Fruit* (detail), 1894. Carnegie Museum of Art, Patron Arts Fund, 22.8."
hero_image_url: "https://collection.cmoa.org/objects/89649ae7-a33d-4f21-b309-ac7e0633b527"
---


## Overview

Art Tracks is an initiative of the [Carnegie Museum of Art (CMOA)](http://www.cmoa.org) that aims to turn provenance in to structured data by building a suite of open source software tools.  These tools transform traditional written provenenance records into searchable data, with an emphasis on existing data standards and a strong focus on building tools that are useful (and usable) across multiple institutions.
  
Once we have converted our provenance information into structured data, we can ask complex questions like “Which works in our collection were in the same city in the same year?” or “Which artworks in our collection were owned by an artist whose work is also in our collection?” By doing more with the data we already have, we can discover gaps in knowledge, shape collections policy, and better understand the ecosystem of the collection and the institution. 

For an overview of the project, please check out the videos from the [2016 Digital Provenance Symposium](/pages/scholars_day_2016).


## Reference Materials

The [**CMOA Provenance Standard**](/reference/standard) is a strict superset of the AAM provenance standard, designed to resolve ambiguities and provide guidance and machine-readability. A draft version (v. 0.2) has been published.  Examples of [records written using the CMOA style](/pages/example_records) are available.

The JSON version of the standard also has a [JSON-Schema](/provenance_schema.json) available that both documents and validates the intermediate JSON version of the provenance standard.

A thesauri of [**Acquisition Methods**](/reference/acquisition_methods) has been created to help explain and define the various ways that works of art can change hands.  There is also [a SKOS version](/acquisition_methods.ttl) of this vocabulary available.


## Software Tools

The [**museum_provenance**](https://github.com/cmoa/museum_provenance) library is the core technology developed for this project.  It takes provenance records and converts them into structured, well-formatted data.

The [**Elysa**](https://github.com/cmoa/elysa) tool is a user interface designed for museum professionals.  It assists with verifying, cleaning, and modifying provenance records. 

An initial [**Prototype**](https://github.com/arttracks/provenance-interactive) of a in-gallery interactive was created in Spring 2015 to research ways to present detailed provenance information to the public.  Much of the work here will inform the upcoming 2017 Northbrook Initiative gallery experience.


---

*Initial funding for **Art Tracks** was provided in part by a generous grant by the [Institute of Museum and Library Services](http://www.imls.gov).  Funding for Phase II has been provided by the [National Endowment for the Humanities](http://www.neh.gov/) with additional research support provided by the [Samuel H. Kress Foundation](http://www.kressfoundation.org) and the [Paul Mellon Centre for Studies in British Art](http://www.paul-mellon-centre.ac.uk/).*
{: .funding }
