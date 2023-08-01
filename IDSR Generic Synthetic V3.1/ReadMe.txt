The purpose of updating the source and CDM dataset from v3.0 to v3.1 is to make the dataset ready for vaccine effectiveness analysis by making the following changes:

(1) Vaccine -> drug_exposure, drug_era, dose_era: Here 12 different COVID-19 vaccines were added in the source dataset that were migrated into 11 Athena standard concepts in the CDM

(2) Specimen Collection -> specimen: Here in the source data, from the earlier two types of specimen collection, now three types have been introduced to cater for PCR (swab collection), Antigen (swab collection) and Antibody (blood collection) tests.

(3) Lab tests -> Measurement: based on the specimen collection, three types of lab tests were mapped voz, PCR, Anitgen and Antibody.

(4) Disease condition -> condition_occurrence: From the earlier version for COVID-19 condition, where it was mapped to COVID-19, now it has been mapped to Suspected COVID-19 and then based on the measurement results, the analysis can draw conclusion wether it was a suspected, probable or confirmed 
