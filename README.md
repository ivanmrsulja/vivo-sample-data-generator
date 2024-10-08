# vivo-sample-data-generator

## Purpose
The VIVO Sample Data Generator (SDG) generates VIVO sample RDF data for
a university, including colleges, departments, people, and works. Works
and people are associated with research areas and subject areas.  Using
configuration properties, the university can be as large or as small
as you wish.

## Requirements

* python 3
* numpy -- for random number generation
* rdflib -- for generation of RDF triples and statements

vivo-sample.data-generator.py runs from the command line:

    > python vivo-sample-data-generator.py

It reads the properties file `sdg.properties` and writes sample data
to the file `sample-data.ttl`  vivo-sample-data-generator.py writes
one line to standard out summarizing what it produced, and how long it
took to produce it.  For example:

    vivo.mydomain.edu 1 University; 2 colleges; 5 departments;
        273 people; 3317 works; 268377 triples in language en
        98.40 seconds

## Features

1. Sizing.  Using parameters in `sdg.properties` you can control the
minimum and maximum:
    1. Number of colleges in the university
    2. Number of departments within each college
    3. Number of faculty members in each department
    4. Numbers of works of each faculty member
    5. Number of projects, ranges for project participants and produced work
    6. Number of grants, ranges for administers, fundraisers and grant participants
    7. Number of equipment units, range for supportees
    8. Number of conferences, invited talks and presentations per conference. Number of courses, as well as the range for number of participants per each event (where applicable)
2. Text and Language.
    * All text is taken from the properties file.  A language can be
    specified as a property.  By replacing the text in the properties
    file with that of another language, and specifying the language tag,
    the resulting data is fully internationalized.
    * Labels are supported in multiple different languages at the same time. By supplying text in label text field and specifying a language tag, labels are automatically generate for that language. Keep in mind that if you specify actual translations for multiple languages, your data will look more realistic.
    * By adding or replacing any of the text properties, sample data
    can be generated that is more reflective of local conditions.
    * See `sdg.properties` for all the text that can be replaced.
3. Realistic distribution of works by faculty members.  The number of
works associated with each faculty member is generated using realistic
probability distributions.
Some faculty will have no publications while others will have many.
4. Probability distribution of works.  Via the properties, a provided
probability distribution of works favoring academic articles can be
replaced with a distribution of your choice.
5. Organization.  The sample university has colleges, and departments
within colleges. Each has a name and organizational structure.
6. Faculty members.  Faculty members have contact information, works,
a position in a department, research areas, and multiple identifiers.
7. Works.  25 types of works are created.  Works have full citation
information including abstracts, subject areas, identifiers,
a link to full text, and a realistically random number of co-authors,
including co-authors in and out of the sample
university.
8. Concepts.  Concepts are created from a list provided in the
properties, and assigned to faculty as
research areas and as subject areas for works.
9. Journals.  A collection of journals are created from a list
provided in the properties.  Each work has a publication venue of one
of the journals.
10. Demonstrations.  Using SDG, you can generate data to demonstrate
and test:
    * Profile pages for people, organizations, journals, works, concepts
    * Contact information and vcards
    * Sparklines
    * Co-author and map of science
    * Capability Map
    * The Index
    * Search results
    * URLs for people and works
    * Organizational structure
    * SPARQL queries
    * Load times for your infrastructure
    * System Admin functions
    * APIs for data retrieval, including TPF and Data Distribution
## Further Information

For more information on VIVO, please visit the the VIVO web site
http://vivoweb.org

For more information on the ontology used to describe VIVO data, please
see the
[Ontology Reference](https://wiki.duraspace.org/display/VIVODOC110x/Ontology+Reference)
in the [VIVO Technical Documentation](https://wiki.duraspace.org/display/VIVODOC110x/VIVO+1.10.x+Documentation).




