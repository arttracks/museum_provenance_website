# The CMOA Provenance Standard

##### Draft Version 0.1<br>Published March 14, 2015

## Statement of Problem

At the Carnegie Museum of Art, as with many institutions, provenance is recorded in a text field within our collections management system.  As such, there is no machine-readable structure, and it is difficult or impossible to automatically analyse the data contained within.

One of the primary goals of Art Tracks is to defined a model and structure for storing and capturing the data within provenance in a machine-readable format.  

## Current Standards

Traditional provenance records, while text, are designed to communicate research effectively and tersely.  As such, there are loose standards defined.

The most common of these standards was defined by the American Association of Museums, in _The AAM Guide to Provenance Research_:

>
Provenance information should be presented in a clear and organized fashion and be as complete as possbile.  The sequence of ownership should be easily understood.  The order of ownership may be earilest to latest owner, or the reverse, as long as the chronology is obvious.  There should be some mechanism by which owners are distinguished from dealers or auctioneers.  The sources of information about each owner or transaction shuld be documented.  In publishing provenance information, the museum should include an explanation of its format.

>
The provenance is listed in chronological order, beginning with the earliest known owner. Life dates of owners, if known, are enclosed in brackets. Uncertain information is indicated by the terms "possibly" or "probably" and explained in footnotes. Dealers, auction houses, or agents are enclosed in parentheses to distinguish them from private owners. Relationships between owners and methods of transactions are indicated by punctuation: a semicolon is used to indicate that the work passed directly between two owners (including dealers, auction houses, or agents), and a period is used to separate two owners (including dealers, auction houses, or agents) if a direct transfer did not occur or is not known to have occurred. Footnotes are used to document or clarify information.

An informal survey of American museums indicate that most museums that explicitly reference a format either use this standard directly or use a modified version with either additions or minor structural modifications.

As such, basing our structured data model off this recommendation seems a wise course of action.

## Technical Considerations

Given the underlying structure of the provenance information, we considered several possibliities for the canonical reference for this information.  To do so, we developed the following set of guidelines for describing our goals

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

Given that two versions of the data is non-optimal, the second option of converting provenance to structured data and treating the textual record as a produced artifact of the data is tempting.  This would allow the data to be the single source of truth.  This is also a technically appealing solution, since it allows the use of existing technological tools (such as relational databases) and simple data modelling constraints.

The major issues with this option revolve around usability.  Given that most museums do not have structured provenance data, in order for the structured data to be the single source of truth, all existing records would have to be converted immediately, or a transition period would have to be enforced where either no new information is added, or all information is added to both places.  Additionally, extensive training would have to be provided to all staff on how to read and write provenance information.

Another constraint is the flexibility of existing Collection Management Systems.  Either the CMS has to be extended to handle the new data, or there has to be a new tool added and maintained to store and handle the data.

Given these issues, the decision was made that the primary description of the structured data should remain the paragraph of provenance text.  This has the benefit of working with existing tooling, and also allowing a gradual conversion of records without problems; however, this presents its own issues.  The largest of these issues is that text is not traditionally an excellent source of unambiguity, and the structure of either English or the AAM guidelines is not sufficient to guarantee parsability.  




## Definition of Provenance

1. A provenance record is, at its core, a paragraph.
2. Each paragraph describes the custody, location, and ownership of a work of art.
2. Each paragraph is made of sentences, with each sentence representing an unbroken, known chain of custody.
3. Each sentence has one or more clauses, separated by semicolons, that represent a single party who has had custody or ownership of the work of art.
4. Each clause can also indicate its certainty.
4. Each clause contains several data points, describing the party, the location, the method of acquisition, the dates of acquisition and deacquisition.
5. Each data point can also indicate its certainty.
4. Each clause can be annotated with footnotes, which contain additional, unstructured information about the clause.


---

## General format

> Possibly by descent to Vincent Price, the artist [1911?-1993], St. Louis, MS, before 1990 [1].



## Capitalization of the first letter

If this is the first record or the previous record ends in a period, capitalize the first word.  Otherwise, use standard capitalization (if it's a proper name, capitalize, if it's not, don't.)

## Period Certainty

If the entire period is uncertain, `Possibly`, otherwise nothing.

## Acquisition Method

**The method of acquisition or transfer.**

Controlled vocabulary— see *list*

Usually the acquisition method goes before the name.  For grammatical sanity, it will occasionally go after the name and the birth/death dates if present.  See the list for options here.

## Name: 

**The name of the party.**

> Claude Monet

If there are clauses, like, "wife of previous" or "the artist", they follow the name.  These clauses are a semi controlled vocabulary—it can be extended as needed.  Please see the *attached list* for current exceptions and vocabulary.

> Michel Monet, son of the artist

not

> Son of the artist, Michel Monet


If the name is uncertain, follow the name with a question mark.

> George Strait?

not

> Possibly George Strait

This prevents confusion around the question of which aspect is certain of uncertain, the party or the entire record.


If the party's name has multiple initials, use a space between them.

> J\. J. Abrams

not

> J.J. Abrams

For estate and other sales, the party is the gallery or auction house that hosted the sale, not the name of the sale. The name of the sale should be contained within a footnote if known.

If the gallery is not known, the party is "The estate of Claude Monet" or something similar.

If the part is not known, use **Unknown party** or **Unknown collector** or something similar.  Don't leave it blank.

If the party is a marriage, and the work is co-owned by the parties of the marriage, the party should be

> Mr & Mrs. Marshall Fields III

For marriages, we are recording only the name of the man as per tradition.  If the wife's name is known, attach it in a footnote.

This is the marriage of these two people, not either of these people themselves.  Any dates or locations should refer to the marriage, and a transfer of provenance should occur if a marriage ends in either death or divorce. 

## Birth and Death dates

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

## Location.


**The location of the owner of the artwork at the time of acquisition.**

*Is this the main residence of the owner?*

> Boston, MA

or 

> Paris, France

or 

> Highclere Castle, Hampshire, England

If the location is uncertain, us a question mark following the last word of the location.

> Glasgow, Scotland?


If the location is in the US, record the city and the state (in zip code two letter abbreviated form, without periods, and with a comma between the city and the state.)

If the location is outside of the US, record the city, the provence or state (if required to prevent ambiguous locations), and the country.  Each of these should be seperated by a comma.

If the location is in a named, notable building, record that building.

If the location has changed names over time, The name of the location is the name of the location at the time of the acquisition.  i.e. Leningrad, not St. Petersburg, if the acquisition took place between 1924 and 1991.

Do not record street names or street numbers.  If this is essential for the record this information can be recorded in a footnote.  Never attach specific identifying information of the party the Museum acquired the work from.

## Period of Ownership

**A description of the time period the work was owned by the party.** 

> before 1996

> Until some time after the 15th Century

> 1995 until 2006

For dates, the preferred forms are

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

## Stock Numbers

**THIS IS DEPRICIATED, AND SHOULD NOT BE USED.  IT WILL BE REMOVED IN THE FINAL DRAFT OF THIS DOCUMENT.**

**A associated stock number for the work in a sale.**

This handles simple stock numbers within a record.  For any complicated record, or additional notes, or problematic records, use a footnote.

> stock no. 55512

> no. 55512

> lot a111

#### Lugt numbers

We are currently treating lugt numbers as a stock number (for expediency.)  The format is

> (L.12312a)

If there is an existing stock number, use one of the other.


## Footnotes

**Additional clarifying information, or any information that cannot be structured.**


> [2]

Footnotes are indicated by a number contained inside brackets at the end of a record.  It should be the last thing within the record, preceding the completing punctuation.

There should only be a single footnote per-owner.  If multiple notes are needed, they can be multiple sentences within the footnote.

Footnotes can contain as much text as needed—they are for clarity and people, not computers.

## Closing punctuation

If the artwork is *known* to be a direct transfer, use a semicolon at the end of the period of ownership. 

> Michel Buble, 1990;

If the artwork is *not* known to be a direct transfer, use a period.

> Michael Jackson, 1986.

If uncertain, assume that the transfer is **not** direct.

## Dealers and Auction Houses

If the owner is not a primary owner, wrap the entire ownership period in parenthesis. 

> (Galarie Durand-Ruel, Paris, France, 1891);

This maintains the historic distinction between primary owners and the auctionners or dealers.

## Notes at the end of the record.

Once all owners are recorded, footnotes appear.

> NOTES:  [1] This is a note. [2] This is also a note.

the string ' NOTES: ' indicates that the footnote section is beginning.   each note is indicated by a number within brackets followed by the note.  Do not link multiple records to a single footnote—duplicate the information if required.   That way, unintentional changes of one owner do not accidentally propagate to other sections.

(due to technical reasons, there is a limit of 99 footnotes per-provenance text.  If this becomes a problem, we can address this in a future version.)

