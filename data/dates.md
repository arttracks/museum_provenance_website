## Precision Rules for Dates

When writing dates for provenance, it's important to state the level of accuracy desired.  As such, we have defined specific formats for writing dates with varying levels of precision.  The preferred form is the correct way to write the dates—the alternate forms are supported, but are not recommended and should be converted into the preferred form.

The following phrasings for dates are preferred for each level of specificity:

### Known to the Century

**Preferred Form:** the 19th century, the 1st century CE, the 2nd century BCE  
**If Uncertain:** the 19th century?, the 8th century BCE?  
**Alternate Forms:** 19th century, 20th Century ad, 19 Century, 4th century BC

Century should always be lowercase.   When referencing centuries before 10th century CE, it is helpful to explicitly include CE.  When referencing centuries BEFORE the first century CE, it is mandatory to include BCE.

Centuries are defined as the years starting with 01 and ending with 00.  For instance, the 18th century is the period between 1801 and 1900.  For BCE centuries, the same holds:  the 8th century BCE is the period between 701 BCE and 800 BCE.

### Known to the Decade

**Preferred Form:** the 1990s  
**If Uncertain:** the 1990s?  
**Alternate Forms:** 1990s, 1990s CE, the 1990s AD

Decades are not a common form for dates, but are often used for (relatively) recent dates.  This form is valid for all decades between the 100s CE and the current date. It is not valid to use this form for dates before 100 CE.

### Known to the Year

**Preferred Form:** 1990, 900 CE, 800 BCE  
**If Uncertain:** 1990?, 900 CE?, 800 BCE?  
**Alternate Forms:**  10 ad, 1 BC, 6000 BCE, 800

BCE is mandatory for years before 1 CE. CE is required when the year is earlier than 1000 CE. CE is strongly preferred (mandatory, but not enforced?) when other dates within the record are BCE.

### Known to the Month

**Preferred Form:** October 1990, October 990 CE     
**If Uncertain:** October 1990?  
**Alternate Forms:** June 2000 CE, March 880, January 80, aug. 1995, 'August, 1995', 'Aug., 1995'

CE is strongly preferred when the year is earlier than 1000 CE. BCE is not currently supported.

**TODO:** Does known to the month make sense for dates BCE?


### Known to the Day

**Preferred Form:** June 11, 1995; June 11, 880 CE; June 11, 880 BCE  
**If Uncertain:** June 11, 1990?  
**Alternate Forms:**  June 11 1995; Oct. 17, 1980; June 15, 90 BCE; 9 June 1932; 9 June, 1932; 10/17/1980; 1980-17-10


### More Precise

*Specificities more accurate than the day are over-precise for the project, and also would introduce time-zone requirements into the specification.  At this point, we do not support precisions greater than a day.*



## Period Specificity

When talking about provenance, the level of uncertainty about the dates of a transfer is often communicated using specific phrases.  Additionally, for each owner, there are two transfers- the transfer **to** the owner and the transfer **away** from the owner.  

Typically, provenance only is concerned with the transfer **to** the owner—the transfer away is captured by the following line.  However, when the next party is unknown, may we have to record the information for both transfers in a single line. If needed, many of these forms can be combined to convey both transfers.  If so, the transfer **to** the party appears before the transfer away, without a comma between. 

To help illustrate what we're talking about, each phrase is followed by up to four dates. The first two dates indicate the possible range of dates that the transfer **to** the party could have happened, and the following two indicate the range of dates that the transfer **from** the party could have happened.

For example: 

    1995-1999...2000-2004
    
means that the painting was acquired no earlier than 1995 and no later than 1999, and that it was sold no earlier than 2000 and no later than 2004.


    ????-1999...????-????

means that we know that the painting was acquired no later than 1999, but that we don't know when before that date it was acquired, and we don't know anything about the transfer **from** the party.

    1995-1995...????-????

means that we know the painting was acquired in 1995, but we are not talking about (or don't know) about the transfer *from* the party.
    
----

### Date Range Examples

**John Doe, 1995 *or* John Doe, on Dec 15, 1995**

    1995-1995...????-????

This work was transferred *to*  John *in* 1995.  Use this when the exact date is known, with as much specificity as is known.  The **on 1995** form is discouraged.


Use this **either** if the following transfer is a direct transfer **or** the following transfer is indirect, but the date when the transfer from John is unknown.



**John Doe, before 1995 *or* John Doe, by 1995 *or* John Doe, as of 1995**
 
    ????-1995...????-????

The work was transferred *to* John *before* 1995.  Use this when you know that John owned the work by 1995 and that the acquisition was prior to that. The "**as of**" form is discouraged.

Technically, **by 1995** means that it could have happened in 1995 or sometime before, whereas **before 1995** means that it did not happen in 1995, but sometime before.  For the purposes of data modeling, this distinction is too fine.  Put it in a note.


**John Doe, after 1995**

    1995-????...????-????

The work was transferred *to* John *after* 1995.  Use this when you know that John **did not** possess the work in 1995, but did sometime after 1995.


**John Doe, until 1995**

    ????-????...1995-1995

The work was owned by John until 1995 and there is a definite record of the transfer *from* John *to* another party in 1995.  

This should only be used when you know that the work was transferred, but you don't know to whom—otherwise, it is implied in the following record.

**John Doe, until at least 1995 _or_ John Doe, until sometime after 1995**

    ????-????...1995-????

The work was owned by John in 1995, and transferred sometime after 1995.  The "**until at least**" form is preferred.

This should only be used when something is known both about the acquisition and about the transfer from John, in conjunction with a statement about the acquisition.  

For example, **"John Doe, 1990 until at least 1995"**.  

Otherwise,  **"John Doe, before 1995"** conveys the same information and is preferred.

**John Doe, until sometime before 1995**

    ????-????...????-1995
    
The work was **not** owned by John in 1995, and was transferred sometime prior to 1995.  The "**until sometime before**" form is preferred.


**John Doe, in 1995**

    ????-1995...1995-????
    
The work was known to be in John's possession in 1995, but nothing is known about the transfer to or transfer from John.

**John Doe, 1995 until 1996 *or* between 1995 and 1996 *or* John Doe, between 1995-1996 *or* John Doe, 1995-1996**

    1995-1995...1996-1996

We know both the exact transfer to and from John, but do not know the party that the work was transferred **to**.  If the party is known, the transfer from is implied and "**John Doe, 1995**" is sufficient. 



### Tables


Using the CIDOC-CRM recommendation for dates, we re

#### No Known Dates

date range| phrasing
---------:|:--------------------------------------
?-?...?-? | no date
{: .table.table-hover.date_table}


#### One Known Date

date range| phrasing
---------:|:--------------------------------------
X-?...?-? | after 1995
?-X...?-? | by 1995
?-?...X-? | until at least 1996
?-?...?-X | until sometime before 1996
{: .table.table-hover.date_table}


#### Two Known Dates

date range| phrasing
---------:|:--------------------------------------
X-X...?-? | 1995
X-Y...?-? | sometime between 1995 and 1996
X-?...Y-? | after 1995 until at least 1996
X-?...?-Y | after 1995 until sometime before 1996
?-X...X-? | in 1995
?-X...Y-? | by 1995 until at least 1996
?-X...?-Y | by 1995 until sometime before 1996
?-?...X-X | until 1996
?-?...X-Y | until sometime between 1995 and 1996
{: .table.table-hover.date_table}

#### Three Known Dates

date range| phrasing
---------:|:--------------------------------------
X-X...Y-? | 1995 until at least 1996
X-Y...Y-? | sometime between 1995 and 1996 until at least 1996 (after 1995, in 1996)?
X-Y...Z-? | sometime between 1995 and 1996 until at least 1997
X-X...?-Y | 1995 until sometime before 1996
X-Y...?-Z | sometime between 1995 and 1996 until sometime before 1997 
?-X...Y-Y | by 1995 until 1996
?-X...X-Y | in 1995 until sometime before 1996
?-X...Y-Z | by 1995 until sometime between 1996 and 1997
X-?...Y-Y | after 1995 until 1996
X-?...Y-Z | after 1995 until sometime between 1996 and 1997
{: .table.table-hover.date_table}

#### Four Known Dates

date range| phrasing
---------:|:--------------------------------------
X-X...X-X | January 1, 1995
X-X...Y-Y | 1995 until 1996 OR on july 1, 1995 (if known to the day)
X-X...Y-Z | 1995 until sometime between 1996 and 1997
X-Y...Z-Z | sometime between 1995 and 1996 until 1997
X-Y...Z-A | sometime between 1995 and 1996 until sometime between 1997 and 1998
{: .table.table-hover.date_table}


## External References

**[c code for time mapping](http://www.cidoc-crm.org/downloads/CIDOC-CRM_temporal_representation.pdf)**

Library for representing and searching within time using the AAT codes.  Allows fuzzy search, uses Allen operators.

[Code (zip)](http://www.cidoc-crm.org/downloads/time_primitive_c_library_1.0.zip)

---

**[Linking Open Descriptions of Events (PDF)](http://oai.cwi.nl/oai/asset/14783/14783A.pdf/)**

>**Abstract:** People conventionally refer to an action or occurrence taking place at a certain time at a specific location as an event. This notion is potentially useful for connecting individual facts recorded in the rapidly growing collection of linked data sets and for discovering more complex relationships between data. In this paper, we provide an overview and comparison of existing event models, looking at the different choices they make of how to represent events. We describe a model for publishing records of events as Linked Data. We present tools for populating this model and a prototype “event directory” web service, which can be used to locate stable URIs for events that have occurred, provide RDFS+OWL descriptions and link to related resources.

---
**[Linked Data design pattern: date recording](http://light.demon.co.uk/wordpress/?p=600)**

A discussion of the various XML date patterns, and a suggestion of a formalized method of implementing them.  Brief, somewhat definitive.

Mentions the following:

* "1686-12-10"^^xsd:date
* "1686-12"^^xsd:gYearMonth,
* "1686"^^xsd:gYear 

Suggests using `[E2_Temporal_Entity]` for dates...

Suggests using the `[crm:E2_Temporal_Entity, crm:P82_at_some_time_within, "1686"^^xsd:gYear]` pattern for single-year dates.

---

**[How to Implement CRM Time in RDF (PDF)](http://www.cidoc-crm.org/docs/How_to%20implement%20CRM_Time_in%20RDF.pdf)**

A brief overview of how the  begin-of-the-begin and end-of-the-end system works as an extension of the **CIDOC-CRM**.

---

**[A brief explanation of time (doc)](http://www.cidoc-crm.org/docs/frbr_oo/frbr_docs/meeting_presentations/10th_meeting_presentations/Allen%20Operators.doc)**

This is a document on Allen Operators, which are the mathematical concept that the **CIDOC-CRM** event model is based on.

---

**[An Interval Algebra for Indeterminate Time (ps)](http://www.cidoc-crm.org/docs/aaai2000.ps)**

A research paper on the math behind analyzing dates.

---

**[Date & Time Formats on the Web](http://www.hackcraft.net/web/datetime/)**

A huge discussion of available web formats for dates.  Not RDF-specfic, but gives a good overview of the sorts of complications with digital dates.

---


**[Deducing event chronology in a cultural heritage documentation system _(Holmen & Ore, CAA 2009)_](http://proceedings.caaconference.org/paper/17_holmen_ore_caa2009/)**

> **Abstract:** In historically oriented research like archaeology, the determination of the chronology of events in the past plays an important role. For example, a fire of a house can seal off the layers physically below and give a partial relative dating of these. A well known tool in this area is the Harris Matrix, used to systematize the contexts and layers found in an excavation. In this paper we will discuss a related but more general tool for documenting and analyzing temporal entities like events. This tool is developed as a module of a four-dimensional event-oriented documentation database based on the conceptual model CIDOC-CRM (ISO21127). The database was developed for an archaeological excavation project in Western Norway. In addition to places, events, and actors, the database is designed to contain texts, images and maps used to document such entities. In use, the system will contain a dataset of events, their time-spans and relations between events. The system can detect conflicting dating, increase precision of beginnings, ends, and durations of events, and finally display a spatial and chronological overview. Given a time and a place within the dataset, the system can display all possible chronologies for the events in the set. So far, this tool has shown great potential, being used in projects involving large amounts of archival material as preparation for new excavations. Further development includes the possibility of using other temporal constraints, such as durations, and exploring the potential of adding spatial constraints and constraints on actors.

---

**[Implementing archaeological time periods using CIDOC CRM and SKOS _(Binding, ESWC2010)_](https://www.semanticscholar.org/paper/Implementing-Archaeological-Time-Periods-Using-Binding/92739646858c201cbd20c09f42c73c8d301a39ae)**

> **Abstract:** Within the archaeology domain, datasets frequently refer to time periods using a variety of textual or numeric formats. Traditionally controlled vocabularies of time periods have used classification notation and the collocation of terms in the printed form to represent and convey tacit information about the relative order of concepts. The emergence of the semantic web entails encoding this knowledge into machine readable forms, and so the meaning of this informal ordering arrangement can be lost. Conversion of controlled vocabularies to Simple Knowledge Organisation System (SKOS) format provides a formal basis for semantic web indexing but does not facilitate chronological inference - as thesaurus relationship types are an inappropriate mechanism to fully describe temporal relationships. This becomes an issue in archaeological data where periods are often described in terms of (e.g.) named monarchs or emperors, without additional information concerning relative chronological context.
An exercise in supplementing existing controlled vocabularies of time period concepts with dates and temporal relationships was undertaken as part of the Semantic Technologies for Archaeological Resources (STAR) project. The general aim of the STAR project is to demonstrate the potential benefits in cross searching archaeological data conforming to a common overarching conceptual data structure schema - the CIDOC Conceptual Reference Model (CRM). This paper gives an overview of STAR applications and services and goes on to particularly focus on issues concerning the extraction and representation of time period information.

* STAR STELLAR has made a catalog of periods but I think it's more focused on relatively recent times (Tudor, Victorian, etc). 

