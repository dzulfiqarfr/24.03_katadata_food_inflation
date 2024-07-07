# Food inflation

The code and data to produce Katadata's "[Mengapa Lonjakan Harga Pangan Paling Memukul Orang Miskin?](https://katadata.co.id/ariayudhistira/analisisdata/6263774b83d0d/mengapa-lonjakan-harga-pangan-paling-memukul-orang-miskin)" story.

## Getting started

### R

You need [R and RStudio](https://posit.co/download/rstudio-desktop/) to run this analysis project.

To open the project, open `24.03_katadata_food_inflation.Rproj`, as this folder is an R project.

The project used the [renv package](https://rstudio.github.io/renv/index.html) to manage its dependencies and ensures reproducibility.

### Statistics Indonesia's web API

The analysis used the inflation data from Statistics Indonesia (BPS). While this data was available on BPS's website, the analysis used the agency's application programming interface (API) to get the data. This should improve the reproducibility.

Thus, you need to set up a [WebAPI BPS](https://webapi.bps.go.id/developer/) account and app. Having created an app, you will get a key to authorize your request. Supply this key to the [bpsr package](https://dzulfiqarfr.github.io/bpsr/) (see [Set API key](https://dzulfiqarfr.github.io/bpsr/articles/bpsr.html#set-api-key)).

### Data

Get the Food Security and Vulnerability Atlas (FSVA) data at the city and regency level in 2021 from the Food Security Agency (BKP) (see [Peta Ketahanan & Kerentanan Pangan (FSVA)](https://fsva.badanpangan.go.id/?09f27a87666909bc41734d24f89fab74)). Download the CSV file and save it in the `data` folder.

Download the [2021 City/Regency Poverty Data and Information](https://www.bps.go.id/id/publication/2021/11/30/9e3602ea496ecc2f4751836f/data-dan-informasi-kemiskinan-kabupaten-kota-tahun-2021.html) report from BPS and save it in the `docs` folder. This report contains data on the share of poor households that received food assistance by province in 2021. You can manually input the data and store it in a spreadsheet in the `results` folder.

## Example

You can produce the analysis by running `run_all.R` in the `src` folder. This is the controller script that runs other scripts.

To run the controller script, you can do it interactively in RStudio or using the console, as follows.

```r
source("src/run_all.R")
```

Or, you can run each script individually.

## License

This project uses the [MIT license](LICENSE.md).