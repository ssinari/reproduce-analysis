FROM rocker/verse:3.6.0
    
ARG WHEN
RUN R -e "install.packages( \
  c(  'gdata'       \
    , 'gplots'      \
    , 'pander'      \
    , 'Hmisc'        \
    , 'memisc'       \
    , 'ggplot2'      \
    , 'tables'       \
    , 'reshape2'     \
    , 'stargazer'    \
    , 'xtable'       \
    , 'rms'          \
    , 'lme4'         \
    , 'readxl'       \
    , 'RColorBrewer' \
    , 'VennDiagram')\
  , repos = 'http://mran.revolutionanalytics.com/snapshot/${WHEN}')"

RUN  R -e "library(BiocManager);BiocManager::install(c(\"readat\",\"biomaRt\",\"genefilter\"))"

