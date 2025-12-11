# Vaccine-Distributer

Takes in a 3xN integer matrix where each column shows information about one patient (phase eligibility for vaccination, number of previous vaccinations, and number of days since the last vaccination)
Takes in an integer number of doses available for distribution

Outputs a 1xN binary matrix showing who receives the vaccines (labelled as 1)

Code desgined to prioritize the following:
- lower phase number
- first doses over second doses for those in the same phase
- no doses provided to those who have received 2 doses already
- no doses to those who received their last dose within 21 days
- first come, first serve
