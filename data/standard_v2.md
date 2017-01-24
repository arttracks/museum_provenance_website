## Introduction

At the Carnegie Museum of Art, as with many institutions, provenance is recorded in a text field within our collections management system.  As such, there is no machine-readable structure, and it is difficult or impossible to automatically analyze the data contained within.

One of the major goals of the Art Tracks project has been to generate a digital model for storing and capturing the data within provenance in a machine-readable format. This document contains our best understanding of that model, along with supporting information and examples.

There are three expressions of this standard.  One is as a Linked Open Data, as an RDF model using the CIDOC-CRM.  The second is as an abstract data model in JSON. The third is a textual model that functions as an extension of the AAM recommended provenance text.  All three expressions are compatible and can be converted to each other.  

## Background

Currently, there are two two models for provenance within the cultural heritage space.  

We have the standard, textual provenance document which has been used for the past hundred-or-so years. This document describes a complex network of relationships between parties, events, locations, and objects in a concise, semi-structured format.  It contains a remarkable wealth of detail about the history of the object, but it relies heavily on the expertise of the reader to be understandable. There are a large number of implicit statements, events, and entities that would need to be extracted from the data to represent the recorded knowledge of provenance in a machine-readable form.  

We also have the CIDOC-CRM, a robust conceptual model for event-based modeling of the history of a object, built upon 20+ years of research into the practices of cultural heritage.  CIDOC-CRM is an extremely comprehensive model capable of representing knowledge at a level of detail that far surpasses what we currently capture in our provenance documents.  It is explicitly designed to support event-based knowledge like that which makes up provenance. However, the complexity of the CRM requires a deep understanding of both the field and the potential uses of the knowledge to appropriately choose a level of detail for modeling provenance.

The software in use at cultural institutions currently work with the textual provenance.  They contain a transcription of the text, but not a digital model of the *meaning* of the text.  However, the tools museums use to record their collections information are robust, well-understood, and deeply embedded into daily museum practice.  

To our knowledge, there are no tools currently in production that support the CIDOC-CRM model of provenance.  There are several research projects underway to transition from the document-based structure of existing collections management towards an event-based model, but they are more than five years away from broad adoption in the museum community. 

The Art Tracks project is designed to ease the transition between these two models. It is explicitly an interim solution, but one that is designed to work within our existing infrastructure, while preparing us to migrate to a semantic, event-based model in the future.

## Design Principles

As we have been developing the linked data model for this standard, we have had three guiding principles:

The first is to maintain the integrity of the CIDOC-CRM, and to use the predicates and classes that it (and its extensions) provide whenever possible.  
The second is to consider that the major purpose of modeling provenance as structured data is to enhance the usability of the provenance—particularly the searchability of the provenance.  At every step, we would like to enhance the ability of a user to locate specific events in the history of an object, and we aim to provide as many hooks into the provenance as possible.

Third, we aim to capture completely the information that makes up the written provenance text.  Provenance data is extremely concise, and to omit any word from the provenance is to omit a detail that the provenance researcher deemed important. 

The structure and model presented below is our best attempt to create a standard that accomplishes our mission while abiding to the principles as closely as possible. 

## Levels of Provenance

Linked data is still a relatively new concept in museums, and very few museums are prepared to embrace it to the level that fully modeling provenance in all its specificity entails.  To 'shorten the on-ramp', we have defined four levels for the digital encoding of provenance.  These levels have been designed to function as strict supersets—each level can also function as each level below. Each level provides a more complete graph of information, additional search abilities, and a more nuanced understanding of the provided provenance text.

### Level One

At this level, we describe a provenance text in which the individual entities contained within the document are not modeled in any fashion. This is a standard model for provenance within an institution where the provenance is merely a single text object, and no additional work is done to model the provenance.

This model is made up of two core CRM entities: a `E31 Document` and an `E7 Activity`.  The document is the provenance text itself, and the activity records the ongoing activities of the owners of an object that involve transfers of ownership and custody[^3].  Both of these entities are assigned a `E55 Type` of [`aat:300055863`](http://www.getty.edu/vow/AATFullDisplay?find=&logic=AND&note=&subjectid=300055863), which is the AAT term for "provenance".[^2]


[^3]:  We choose to use E7 Activity instead of E4 Period to model this series of activities for two reasons.  First, because it allows us to associate actors and objects directly with the Activity, which becomes useful at later levels, and second because we feel that it the class that most accurately represents the agency of human activity that defines this period. 

[^2]:  We feel that using AAT to define our types is a suitable best practice, and one that we will continue throughout this model whenever possible.  Our feeling is that the implicit assignment of AAT vocabulary terms the class E55 Type through the use of `crm:P2_has_type` is an acceptable practice despite lack of explicit statement.  An alternate model of `crm:P2_has_type _:type. _:type skos:exactMatch _:aat_term .` is possible, but does not add any additional abilities to our model while adding complexity, and as such is discouraged.




### Level Two

This level assumes that there is a software entity that is capable of 
processing the provenance text, but that it doesn't have any special 
knowledge of provenance in particular.  Named Entity Recognition or simple
string matching against authority files would be examples of this level
of processing.



### Level Three

### Level Four *(unimplemented)*


## Textual Provenance Standard

### General format

> Possibly purchased at auction by John Doe? [1910?-1995?], Boise, ID, for daughter of previous, Sally Moe, Baroness of Leeds [1940-],  Pittsburgh, PA?, at "Sale of Pleasant Goods", Christie's, in London, England, sometime after November 5, 1975 (stock no. 10, for $1000) [1][a][b].
> 
> Notes:
> 
> [1].  Purchased on the occasion of her birthday.
> 
> Authorities:
> 
> John Doe:                      see http://ulan.getty.com/123455  
> Boise, ID:                     see http://geonames.com/123456  
> Sally Moe, Baroness of Leeds:  see http://viaf.org/123456  
> Pittsburgh, PA:                see http://tgn.getty.org/123456  
> London, England:               see http://geonames.com/555121  
> Christie's:                    see http://viaf.org/1234569
> Sale of Pleasant Goods:        no record found.
> 
> Citations:
> 
> [a]. See Arnau, F. (1961). The art of the faker: Three thousand years of deception. Boston: Little, Brown. http://www.worldcat.org/oclc/873114  
> [b]. See curatorial file, Carnegie Museum of Art.


### Capitalization of the first letter

If this is the first record or the previous record ends in a period, capitalize the first word.  Otherwise, use standard capitalization. (if it's a proper name, capitalize, if it's not, don't.)

### Period Certainty

If the entire period is uncertain, `Possibly`, otherwise nothing.[^1]

[^1]: We have decided not to include a vocabulary or "levels" of uncertainty, because we don't have a good system for determining how these levels would be specified.  We also differenciate between "Probably", which refers to the entire period, and "?", which we use to indicate that individual parts of the record might be questionable.

### Acquisition Method

**The method of acquisition or transfer.**

Acquisition methods describe the means and terms around the transfer of custody and/or ownership of the work.  This covers standard methods such as sales or gifts, but it also covers creation, destruction, loans, and other ways that artwork can be transferred.  In particular, is is worth mentioning party transformations, which are transfers that happen when the legal owner of the work changes because the owner's legal identity has changed, not because of any transfer of the work itself:  for example, marriage, widowhood, or institutional consolidation.

An exhaustive list of these terms are available [on our website](/reference/acquisition_methods), as well as a [SKOS ontology](/acquisition_methods.ttl) that defines the vocabulary. 

Each term has a name, but it also has a preferred phrase that signifies that term for use in written provenance.  When writing a provenance, this acquisition method phrase appears before the name.

### Types of Parties

When reviewing these records, there are often multiple people involved: owners, custodians, and agents, and auction houses.  Often the owner and custodian are the same person, and agents may not always be present.

When writing this, the name that appears after the acquisition method is assumed to be the acquiring party **UNLESS** that name clause is followed by the word "for" followed by another name clause.  In that case, the first name refers to the purchasing agent, and the second to the acquiring party.   

For example, "Purchased by John Doe" assumes that John is the acquiring party, but "Purchased by John Doe for Sally Moe" assumes that Sally is the acquiring party and John is her agent.

Commissions where the artist is not assumed to have ownership of the work would also be referred to this way, for example: "Commissioned from Fritz Franz, the artist, for Sally Moe" would assume that Sally Moe was the acquiring party, and that Fritz was the artist.  In cases where the artist is not known, you can use the alternate form "Commissioned by Sally Moe", though this is discouraged.

Seller's agents, typically auction houses and galleries, can be referred to by a name clause followed by "at"[^agent_clause].  If there is a specific, named event involved, that event should be called out in double quotation marks, followed by a comma.

For example, 'Purchased by John Doe at Bitforms Gallery' or 'Purchased by John Doe at "Digital Works", Bitforms Gallery'.

[^agent_clause]: Should this be 'from', not 'at'?  Would make more sense when talking about individuals who are sellers agents, but might be confusing.  We could also use 'through' here...


### Party Clauses

Each individual mentioned follows the same form.

**The name of the acquiring party.**

> Claude Monet

**Titles**

Often parties have titles that are associated with them.  These should be included when relevant, however, they MUST be included as part of the name in the authority record for the party.  See the section on Authority Records for more information about this.

**Relationships**

Often it can be clarifying to state the relationship between the acquiring party and the previous owner.  Given the myriad ways that humans can be related, this is often better addressed through a comprehensive model in an athority file.  Thus, we have chosen to not allow any possible relationship here—instead, we allow only a single, familial relationship.  If there are multiple relationships, as occasionally happens, we prioritize marriage over any other relationship.

The allowed relationships are:

* "wife of previous"
* "husband of previous"
* "son of previous"
* "daughter of previous"
* "nephew of previous"
* "niece of previous"
* "mother of previous"
* "father of previous"
* "uncle of previous"
* "aunt of previous"
* "grandchild of previous"
* "grandparent of previous"
* "relative of previous"

The other specific clause allowed here is "the artist", which should appear ONLY in the first period of a provenance.  Occasionally, an artist may re-acquire a work, but in those cases it should not be explicitly mentioned that they are the artist. 

These clauses directly follow[^follow] the name, separated by a comma.  For example:

> Michel Monet, son of previous

not

> Son of previous, Michel Monet

[^follow]: Should this be before or after?  Worth talking through.

If the name is uncertain, follow the name with a question mark.

> George Strait?

not

> Possibly George Strait

Using a question mark and not a certainty word prevents confusion around the question of which aspect is certain of uncertain, the party or the entire record.


If the party's name has multiple initials, use a space between them.

> J\. J. Abrams

not

> J.J. Abrams


If the party is not known, use **Unknown party** or **Unknown collector** or something similar.  Don't leave it blank.

If the acquiring party is a marriage, a partnership, a purchase in shares, or any other form of joint ownership, there must be an entity that holds legal ownership of the work.  For instance:

> Mr & Mrs. Marshall Fields III

This is the marriage of these two people, not either of these people themselves.  Any dates or locations should refer to the marriage, and a provenance event (typically a Transformation of Party) should occur if a marriage ends in either death or divorce. 

### Birth and Death dates

**Birth and Death dates of a party. 
Years of operation if an organization.  
Years of marriage if a marriage.**

Birth and death dates are years, enclosed within braces and separated by a dash.  

> [1880-1955]

If the date is unknown, or the party is still alive, exclude that date, but leave the dash.

> [1880-] or [-1955]

If either of the dates is uncertain, follow that date with a question mark.

> [1880?-1990]

For years BCE,

> [500BCE-450BCE]

### Locations

**A location associated with the owner of the artwork at the time of acquisition.**

Locations in provenance have traditionally be used as a way to uniquely identify individuals.  Because of this, the nature of the location traditionally recorded in provenance is ambiguous—it doesn't have specific semantic meaning.  This standard uses Linked Data unique identifiers as a technique for uniquely identifying individuals, but having these locations present still provides benefits to humans reading the written records.

Because of this, we have chosen to consider the location that directly follows any party's name to be a location **associated** with that person.  In general, it would be appropriate to choose a location most appropriate for the object under discussion, but that is not a requirement, just a suggestion.

For the specific location where an acquisition takes place, we've added the ability to have a location preceded by `in`.  This location is explicitly the location where the acquisition took place, and is often associated with an auction house or sale.  None of these locations are required, but it can be helpful if the location is known to explicitly call it out using the `in` form because it helps with location-based research.

For example:  

> Purchased by John Doe, London, England;

Would mean that London is a location primarily associated with John, even if the artwork was purchased while he was on holiday in Spain.

> Purchased by John Doe in Barcelona, Spain;

Would explicitly place that purchase in Spain, but would not associate John with Barcelona (beyond his potential presence to purchase the work).

> Purchased by John Doe, London, England, in Barcelona, Spain;

Would explicitly state both facts.  This is often not required, but can be done if it is clarifying in some way.


#### Writing Specific Locations

If the location is uncertain, us a question mark following the last word of the location.

> Glasgow, Scotland?


If the location is in the US, record the city and the state (in zip code two letter abbreviated form, without periods, and with a comma between the city and the state.)

> Boston, MA


If the location is outside of the US, record the city, the province or state (if required to prevent ambiguous locations), and the country.  Each of these should be separated by a comma.

> Paris, France

If the location is in a named, notable building, record that building.

> Highclere Castle, Hampshire, England


Do not record street names or street numbers within provenance locations.

If the location has changed names over time, the name of the location is typically recorded the name of the location at the time of the acquisition.  i.e. Leningrad, not St. Petersburg, if the acquisition took place between 1924 and 1991.  All locations are typically recorded in English, and should be in written using the most recognizable or appropriate form. Locations are included in the Authority section, which helps deal with the ambiguity of names for specific places.  Think of the words as being a way to describe the location as it would be referred to in art history, and the Authority record referring to a specific physical location.

### Period of Ownership

**A description of the time period the work was owned by the party.** 

> before 1996

> Until some time after the 15th Century

> 1995 until 2006

For dates, the preferred forms are:

- 19th century
- 1990s
- 1990
- October 1990
- October 11, 1990

Years before 1 CE are specified with BCE.

> 5th century BCE

Uncertainty is indicated with a question mark following the last part of the date phrase

> until October 1885?

Years are recorded in Gregorian form, using the October 4, 1582 as the first day of the Gregorian calendar.  For years earlier than 1582, use the proleptic Gregorian Calendar.

The year immediately preceding 1 CE is 1 BCE.  There is no year zero.

### Stock Numbers

**A associated stock number for the work in a sale.**

This handles simple stock numbers within a record.  For any complicated record, or additional notes, or problematic records, use a footnote.

> stock no. 55512

> no. 55512

> lot a111

### Footnotes

**Additional clarifying information, or any information that cannot be structured.**


> [2]

Footnotes are indicated by a number contained inside brackets at the end of a record.  It should be the last thing within the record, preceding the completing punctuation.

There should only be a single footnote per-owner.  If multiple notes are needed, they can be multiple sentences within the footnote.

Footnotes can contain as much text as needed—they are for clarity and people, not computers.

### Closing Punctuation

If the artwork is *known* to be a direct transfer, use a semicolon at the end of the period of ownership. 

> Michel Buble, 1990;

If the artwork is *not* known to be a direct transfer, use a period.

> Michael Jackson, 1986.

If uncertain, assume that the transfer is **not** direct.

### Dealers and Auction Houses

If the owner is not a primary owner, wrap the entire ownership period in parenthesis. 

> (Galarie Durand-Ruel, Paris, France, 1891);

This maintains the historic distinction between primary owners and the auctionners or dealers.

### Notes at the end of the record.

Once all owners are recorded, footnotes appear.

> Notes:  [1] This is a note. [2] This is also a note.

the string ' Notes: ' indicates that the footnote section is beginning.   each note is indicated by a number within brackets followed by the note.  Do not link multiple records to a single footnote—duplicate the information if required.   That way, unintentional changes of one owner do not accidentally propagate to other sections.


### Authority


### Citations


----

## Appendices 

### I. Why Text?

Given the underlying structure of the provenance information, we considered several possibilities for the canonical reference for this information.  To do so, we developed the following set of guidelines for describing our goals:

1. Provenance must be represented as unambiguous structured data.
2. There should only be a single source of truth for provenance data.
3. The provenance information should follow industry standards when available.
4. Provenance should balance simplicity, capturing nuance, and unambiguity.
5. Information should not be discarded.
6. The system should be designed for usability.
7. The system should be as simple as possible.
8. The system should be technologically feasible.
9. Not all information can be unambiguous.
10. Not all information can be structured.
11. The current industry standard for provenance records is a paragraph of standardized text.

Designing for usability, as well as designing for a single source of truth, means that there exists a conflict between the traditional provenance record as a block of text and the requirements of structured data.

One option was to ignore the requirement for a single source of truth, and have both structured and unstructured representations of provenance data.  While technically the easiest option, it is very easy for the two sources of data to diverge, and there would be no method to detect such divergences.  Enforcing data constraints with policy tends to be less than optimal, and without a detection mechanism, experience has shown that one of the two systems will become untrusted.

Given that two versions of the data is non-optimal, the second option of converting provenance to structured data and treating the textual record as a produced artifact of the data is tempting.  This would allow the data to be the single source of truth.  This is also a technically appealing solution, since it allows the use of existing technological tools (such as relational databases) and simple data modeling constraints.

The major issues with this option revolve around usability.  Given that most museums do not have structured provenance data, in order for the structured data to be the single source of truth, all existing records would have to be converted immediately, or a transition period would have to be enforced where either no new information is added, or all information is added to both places.  Additionally, extensive training would have to be provided to all staff on how to read and write provenance information.

Another constraint is the flexibility of existing Collection Management Systems.  Either the CMS has to be extended to handle the new data, or there has to be a new tool added and maintained to store and handle the data.

Given these issues, the decision was made that the primary description of the structured data should remain the paragraph of provenance text.  This has the benefit of working with existing tooling, and also allowing a gradual conversion of records without problems; however, this presents its own issues.  The largest of these issues is that text is not traditionally an excellent source of unambiguity, and the structure of either English or the AAM guidelines is not sufficient to guarantee parsability.  

### II. Example Provenance as Text

This is the provenance for [The New Testament](https://www.asia.si.edu/collections/edan/object.php?q=fsg_F1937.41), owned by the Freer\|Sackler.  The provenance of this object has been reformatted to use the CMOA Provenance Standard.  **This is being used as a demonstration of syntax and should not be considered an authoritative record.**

> Mrs. Serunian [1][a]; by inheritance to Dr. H. H. Serunian, her son, Worcester, Massachusetts [b];  purchased by Freer Gallery of Art, 1937.
> 
> Notes:
> 
> [1]. Excerpt from the Curatorial Remark 1 in the object record: “Dr. Serunian inherited the book from his mother who was an Assyrian and brought it with her to this country. Dr. Serunian says that the covers were removed from the book to make it more easily portable when his mother's relatives escaped from Kurdistan to Persia in 1916.” 
> 
> Authorities:
> 
> Mrs. Serunian:            see http://asia.si.edu/collections/freer/consitutents/id/14160  
> Dr. H. H. Serunian:       see http://asia.si.edu/collections/freer/consitutents/id/14161  
> Worcester, Massachusetts: see http://www.geonames.org/4956199  
> Freer Gallery of Art:     see http://asia.si.edu/collections/freer/consitutents/id/3326  
> 
> Citations:
> 
> [a]. Curatorial Remark 1 in the object record.  
> [b]. Curatorial Remark 1 in the object record.

### III. Example Provenance as RDF

This is an example of the same provenance record as above, but represented as RDF in turtle.  Each of the levels represented here build on each other.  For conciseness, we do not duplicate information at each level; assume all of the statements at previous levels exist at the following ones, as well.

---

#### Level One

~~~ turtle
# The Art object (only the essential bits for this)
freer_object:10173 a crm:E22_Man-Made_Object ;
  rdfs:label "The New Testament";
  crm:P52_has_current_owner freer_constituent:3326.

# The Owner is:
freer_constituent:3326 a crm:E40_Legal_Body;
  rdfs:label "Freer Gallery of Art".
~~~

The provenance text itself is documented as a `E31 Document`.  This is the traditional, written text of a provenance statement, typically written following a museum's standard form.  

~~~ turtle

freer_object:10173_provenance a crm:E31_Document ;

  # We use `P2 has type` to distinguish this text from any other
  # document about the object.
  crm:P2_has_type aat:300055863;  # "provenance"

  # We use `P70 documents` to refer to period covered by the documented history
  # of ownership for the object.  This is what the content of provenance is.
  crm:P70_documents freer_object:10173_provenance_period ;

  # We use `P129 is about` to refer to the object that is the subject of the
  # the provenance.  This differs from `P70 documents` in that it is what the
  # provenance refers to, not what it is documenting.  
  crm:P129_is_about freer_object:10173 ;

  # We use `P3_has_note` to document the actual text of the provenance.
  crm:P3_has_note "Mrs. Serunian [1][a]; by inheritance to Dr. H. H. Serunian, her son, Worcester, Massachusetts [b]; purchased by Freer Gallery of Art, 1937.\n\nNotes:\n\n[1]. Excerpt from the Curatorial Remark 1 in the object record: “Dr. Serunian inherited the book from his mother who was an Assyrian and brought it with her to this country. Dr. Serunian says that the covers were removed from the book to make it more easily portable when his mother's relatives escaped from Kurdistan to Persia in 1916.” \n\nAuthorities:\n\nMrs. Serunian:            see ...\nDr. H. H. Serunian:       see ...\nWorcester, Massachusetts: see ...\nFreer Gallery of Art:     see ...\n\nCitations:\n\n[a]. Curatorial Remark 1 in the object record.\n[b]. Curatorial Remark 1 in the object record." ;
  
  # We have a `rdfs:label` to provide information to a human user who wants to 
  # understand what this entity represents. 
  rdfs:label "The provenance of Freer|Sackler object 10173, 'The New Testament'." .

~~~

The complete sequence of events that make up the provenance are documented as a `E7 Activity`. This event contains all of the events in the object's history that relate to the ownership and custody of the object. It stretches from the moment the work is considered to exist until either the current moment or the documented distruction of the work. At this level there are no individually modeled acquisition events.
 
~~~ turtle
freer_object:10173_provenance_period a crm:E7_Activity ;
  crm:P2_has_type aat:300055863 ; # Provenance
  crm:P16_used_specific_object freer:10173 ;
  crm:P4_has_time-span freer_object:10173_provenance_period_timespan;
  rdfs:label "The transfers of ownership and custody of Freer|Sackler object 10173, 'The New Testament'.".

freer_object:10173_provenance_period_timespan a crm:E52_Time-Span;
  crm:P82_at_some_time_within "1213/open";
  dct:conformsTo <https://www.loc.gov/standards/datetime/>;
  rdfs:label "1213 until the current day".
~~~


---

#### Level Two


To the document, we add references to all locations mentioned.  At this level, we can't distinguish between the various types of locations mentioned, so we associate them all with the document.

~~~ turtle
freer_object:10173_provenance a crm:E31_Document ;
  crm:P67_refers_to geonames:4956199.               #Worcester, Massachusetts
~~~

We also associate the parties and URLs found within the document with the overall provenance period.  

~~~ turtle
freer_object:10173_provenance_period a crm:E7_Activity ;
  crm:P11_had_participant freer_constituent:14160;  #Mrs. Serunian
  crm:P11_had_participant freer_constituent:14160;  #Dr. H. H. Serunian
  crm:P11_had_participant freer_constituent:3326;   #Freer Gallery of Art
  crm:P70i_is_documented_in <http://asia.si.edu/collections/curatorialnotes/id/10173>
~~~

---

#### Level Three

~~~ turtle
freer_object:10173 a crm:E22_Man-Made_Object ;
  crm:P50_has_current_keeper freer_constituent:3326;
~~~

The List of people involved are:

~~~ turtle
# The Current Owner
freer_constituent:3326 a crm:E40_Legal_Body;
  crm:P53_has_former_or_current_location geonames:4140980. #Washington, DC.

# The first owner:
freer_constituent:14160 a crm:E21_Person;
  rdfs:label "Mrs. Serunian";
  crm:P53_has_former_or_current_location geonames:4956199. #Worcester, Massachusetts

# The second owner:
freer_constituent:4274 a crm:E21_Person;
  rdfs:label "Dr. H. H. Serunian";
  ulan:1511_child_of freer_constituent:14160;
  crm:P53_has_former_or_current_location geonames:4956199. #Worcester, Massachusetts
~~~


This is the timeline of significant events in the history of this manuscript

~~~ turtle
freer_object:10173_provenance_period a crm:E4_Period ;
  crm:P9_consists_of freer_object:10173_initial_ownership ;
  crm:P9_consists_of _:10173_prov-1 ;
  crm:P9_consists_of _:10173_prov-2 ;
  crm:P9_consists_of _:10173_prov-3 .
~~~

The initial ownership by an unknown person.

~~~ turtle
freer_object:10173_initial_ownership a crm:E8_Acquisition, crm:E10_Transfer_of_Custody;
  crm:P2_has_type mprov_acq:creation;
  crm:P30_custody_transferred_of freer_object:10173.
  crm:P24_acquired_title_of freer_object:10173.
~~~


When Ms. Serunian. acquired the manuscript

~~~ turtle
_:10173_prov_1 a crm:E8_Acquisition, crm:E10_Transfer_of_Custody;
  crm:P2_has_type mprov_acq:acquisition;

  crm:P30_custody_transferred_of freer_object:10173;
  crm:P24_acquired_title_of    freer_object:10173;
  crm:P22_transferred_title_to freer_constituent:14160;
  crm:P29_custody_received_by  freer_constituent:14160;
  crm:P3_has_note "Mrs. Serunian";
  crm:P129i_is_subject_of _:10173_prov_1_footnote.

_:10173_prov_1_footnote a crm:E33_Linguistic_Object;
  crm:P2_has_type aat:300265639;
  crm:P3_has_note "Excerpt from the Curatorial Remark 1 in the object record: “Dr. Serunian inherited the book from his mother who was an Assyrian and brought it with her to this country. Dr. Serunian says that the covers were removed from the book to make it more easily portable when his mother's relatives escaped from Kurdistan to Persia in 1916.” See Curatorial Remark 1 in the object record.".
~~~

 When Ms. Serunian. acquired the manuscript

~~~ turtle
_:10173_prov_2 a crm:E8_Acquisition, crm:E10_Transfer_of_Custody;
  crm:P2_has_type mprov_acq:bequest;

  crm:P120i_occurs_after _:10173_prov_1;

  crm:P30_custody_transferred_of freer_object:10173;
  crm:P24_acquired_title_of    freer_object:10173;

  crm:P23_transferred_title_from freer_constituent:14160;
  crm:P28_custody_surrendered_by freer_constituent:14160;

  crm:P22_transferred_title_to freer_constituent:4274;
  crm:P29_custody_received_by  freer_constituent:4274;

  crm:P3_has_note " To 1937\nDr. H. H. Serunian, Worcester, Massachusetts; by inheritance from his mother, Mrs. Serunian.".
  crm:P129i_is_subject_of _:10173_prov_2_footnote.

_:10173_prov_2_footnote a crm:E33_Linguistic_Object;
  crm:P2_has_type aat:300265639;
  crm:P3_has_note "Curatorial Remark 1 in the object record.".
~~~

The third transfer:

~~~ turtle
_:10173_prov_3 a crm:E8_Acquisition, crm:E10_Transfer_of_Custody;
  crm:P2_has_type mprov_acq:purchase;

  crm:P120i_occurs_after _:10173_prov_2;

  crm:P30_custody_transferred_of freer_object:10173;
  crm:P24_acquired_title_of    freer_object:10173;

  crm:P23_transferred_title_from freer_constituent:4274;
  crm:P28_custody_surrendered_by freer_constituent:4274;

  crm:P22_transferred_title_to freer_constituent:3326;
  crm:P29_custody_received_by  freer_constituent:3326;

  crm:P3_has_note "From 1937\nFreer Gallery of Art, purchased from Dr. H. H. Serunian, Worcester, Massachusetts.";
  crm:P129i_is_subject_of _:10173_prov_3_footnote;

  crm:P4_has_time-span _:10173_prov_3_timespan.
  
_:10173_prov_3_timespan a crm:E52_Time-Span;
  crm:P82a_begin_of_the_begin "1937";
  rdfs:label "From 1937".

_:10173_prov_3_footnote a crm:E33_Linguistic_Object;
  crm:P2_has_type aat:300265639;
  crm:P3_has_note "See note 2.".
~~~





### IV. Example Provenance as JSON

#### Level One

~~~ json
provenance: {
  object_id: "http://asia.si.edu/collections/freer/object/10173",
  provenance_text: "Mrs. Serunian [1][a]; by inheritance to Dr. H. H. Serunian, her son, Worcester, Massachusetts [b]; purchased by Freer Gallery of Art, 1937.\n\nNotes:\n\n[1]. Excerpt from the Curatorial Remark 1 in the object record: “Dr. Serunian inherited the book from his mother who was an Assyrian and brought it with her to this country. Dr. Serunian says that the covers were removed from the book to make it more easily portable when his mother's relatives escaped from Kurdistan to Persia in 1916.” \n\nAuthorities:\n\nMrs. Serunian:            see ...\nDr. H. H. Serunian:       see ...\nWorcester, Massachusetts: see ...\nFreer Gallery of Art:     see ...\n\nCitations:\n\n[a]. Curatorial Remark 1 in the object record.\n[b]. Curatorial Remark 1 in the object record.",
  existence_interval: "1213/open"
}

~~~

#### Level Two

~~~ json
provenance: {
  object_id: "http://asia.si.edu/collections/freer/object/10173",
  provenance_text: "Mrs. Serunian [1][a]; by inheritance to Dr. H. H. Serunian, her son, Worcester, Massachusetts [b]; purchased by Freer Gallery of Art, 1937.\n\nNotes:\n\n[1]. Excerpt from the Curatorial Remark 1 in the object record: “Dr. Serunian inherited the book from his mother who was an Assyrian and brought it with her to this country. Dr. Serunian says that the covers were removed from the book to make it more easily portable when his mother's relatives escaped from Kurdistan to Persia in 1916.” \n\nAuthorities:\n\nMrs. Serunian:            see ...\nDr. H. H. Serunian:       see ...\nWorcester, Massachusetts: see ...\nFreer Gallery of Art:     see ...\n\nCitations:\n\n[a]. Curatorial Remark 1 in the object record.\n[b]. Curatorial Remark 1 in the object record.",
  existence_interval: "1213/open"
}

~~~

#### Level Three

~~~ json
provenance: {
  object_id: "http://asia.si.edu/collections/freer/object/10173",
  provenance_text: "Mrs. Serunian [1][a]; by inheritance to Dr. H. H. Serunian, her son, Worcester, Massachusetts [b]; purchased by Freer Gallery of Art, 1937.\n\nNotes:\n\n[1]. Excerpt from the Curatorial Remark 1 in the object record: “Dr. Serunian inherited the book from his mother who was an Assyrian and brought it with her to this country. Dr. Serunian says that the covers were removed from the book to make it more easily portable when his mother's relatives escaped from Kurdistan to Persia in 1916.” \n\nAuthorities:\n\nMrs. Serunian:            see ...\nDr. H. H. Serunian:       see ...\nWorcester, Massachusetts: see ...\nFreer Gallery of Art:     see ...\n\nCitations:\n\n[a]. Curatorial Remark 1 in the object record.\n[b]. Curatorial Remark 1 in the object record.",
  existence_interval: "1213/open",

  periods: [
    {
      period_certainty: true,
      original_text: "asdadadasd",
      footnote: "blah blah blah",
      citations: ["http://...", "...", "asdasd"],
      owner: {
        owner_id: "ulan:12345",
        owner_certainty: "true",
        owner_relationship_to_previous: "her daugher",
        owner_residence_id: "geonames:12345"
        owner_residence_certainty: "true"
      },
      custodian: {
        custodian_id: "ulan:12345",
        custodian_certainty: "true",
        custodian_relationship_to_previous: "her daugher",
        custodian_residence_id: "geonames:12345"
        custodian_residence_certainty: "true"
      },
      transfer: {
        direct_transfer: true,
        location_certainty: true,
        location_id: "geonames:1234",
        method_id: "prov_acq:gift",
        botb: "1995",
        bote: "1995",
        eotb: "1995",
        bote: "1995",
        botb_certainty: true,
        bote_certainty: true,
        eotb_certainty: true,
        bote_certainty: true       
      },
      agent: {
        agent_id: "ulan:12346",
        agent_certainty: "true",
        agent_residence_certainty: "true",
        agent_residence_id: "geonames:12346"
      },
      purchase: {
        price: 1234,
        currency: "lira",
        lot:  "l. 12345",
        sale_id: "getty:12345",
      }
    }
  ],

  agents: [{
    id: "ulan:12345",
    name: "Jane Doe",
    birth: "1995",
    birth_certainty: "true",
    death: ""
    death_certainty: "true",
  },{
    id: "ulan:12346",
    name: "John Doe",
    birth: "1800",
    birth_certainty: "true",
    death: "1900"
    death_certainty: "true",
  }],

  places: [{
    id: "geonames:12345",
    name: "London, England"
  },{
    id: "geonames:12346",
    name: "Pittsburgh, PA"
  },

  events: [{
    id: "getty:12345",
    venue: "ulan:12345",
    location: "geonames:12345",
    title: "Northbrook Sale"
  }]
~~~
