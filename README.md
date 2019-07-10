
<!-- README.md is generated from README.Rmd. Please edit that file -->

# htable

The goal of htable is to translate R data.frames into styled HTML
tables.

## Installation

``` r
# install.packages("devtools")
devtools::install_github("fazetu/htable")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(htable)
ex <- data.frame(
  A = 1:10,
  B = 10:1,
  C = -4:5,
  D = letters[1:10],
  E = c(1, NA, 2, NA, 3, NA, 4, NA, 5, NA),
  Pct = runif(10),
  Big = 100000:100009,
  Money = c(100, 200, -100, -200, 1000.11, 2000.22, -1000.11, -2000.22, 0, 0.11),
  stringsAsFactors = FALSE
)
```

First create the HTable object in one of two ways:

``` r
# ht <- HTable$new(ex)
ht <- htable(ex)
```

To get the HTML for this table:

``` r
ht$render()
#> [1] "<table style='margin-left:auto;margin-right:auto;'><thead><tr><th><span>A</span></th><th><span>B</span></th><th><span>C</span></th><th><span>D</span></th><th><span>E</span></th><th><span>Pct</span></th><th><span>Big</span></th><th><span>Money</span></th></tr></thead><tbody><tr><td><span>1</span></td><td><span>10</span></td><td><span>-4</span></td><td><span>a</span></td><td><span>1</span></td><td><span>0.492585231550038</span></td><td><span>100000</span></td><td><span>100</span></td></tr><tr><td><span>2</span></td><td><span>9</span></td><td><span>-3</span></td><td><span>b</span></td><td><span>NA</span></td><td><span>0.76806613872759</span></td><td><span>100001</span></td><td><span>200</span></td></tr><tr><td><span>3</span></td><td><span>8</span></td><td><span>-2</span></td><td><span>c</span></td><td><span>2</span></td><td><span>0.348551977192983</span></td><td><span>100002</span></td><td><span>-100</span></td></tr><tr><td><span>4</span></td><td><span>7</span></td><td><span>-1</span></td><td><span>d</span></td><td><span>NA</span></td><td><span>0.771511870902032</span></td><td><span>100003</span></td><td><span>-200</span></td></tr><tr><td><span>5</span></td><td><span>6</span></td><td><span>0</span></td><td><span>e</span></td><td><span>3</span></td><td><span>0.141470255097374</span></td><td><span>100004</span></td><td><span>1000.11</span></td></tr><tr><td><span>6</span></td><td><span>5</span></td><td><span>1</span></td><td><span>f</span></td><td><span>NA</span></td><td><span>0.775738270487636</span></td><td><span>100005</span></td><td><span>2000.22</span></td></tr><tr><td><span>7</span></td><td><span>4</span></td><td><span>2</span></td><td><span>g</span></td><td><span>4</span></td><td><span>0.626521660713479</span></td><td><span>100006</span></td><td><span>-1000.11</span></td></tr><tr><td><span>8</span></td><td><span>3</span></td><td><span>3</span></td><td><span>h</span></td><td><span>NA</span></td><td><span>0.0925577846355736</span></td><td><span>100007</span></td><td><span>-2000.22</span></td></tr><tr><td><span>9</span></td><td><span>2</span></td><td><span>4</span></td><td><span>i</span></td><td><span>5</span></td><td><span>0.405598992016166</span></td><td><span>100008</span></td><td><span>0</span></td></tr><tr><td><span>10</span></td><td><span>1</span></td><td><span>5</span></td><td><span>j</span></td><td><span>NA</span></td><td><span>0.289630953222513</span></td><td><span>100009</span></td><td><span>0.11</span></td></tr></tbody></table>"
```

To write the HTML to a file:

``` r
ht$writeLines("table.html")
```

In an RMarkdown document, include in your chunk settings
`results="asis"` in order to get the actual HTML table to render. This
chunk has `results="asis"`.

``` r
ht$Rmd()
```

<table style="margin-left:auto;margin-right:auto;">

<thead>

<tr>

<th>

<span>A</span>

</th>

<th>

<span>B</span>

</th>

<th>

<span>C</span>

</th>

<th>

<span>D</span>

</th>

<th>

<span>E</span>

</th>

<th>

<span>Pct</span>

</th>

<th>

<span>Big</span>

</th>

<th>

<span>Money</span>

</th>

</tr>

</thead>

<tbody>

<tr>

<td>

<span>1</span>

</td>

<td>

<span>10</span>

</td>

<td>

<span>-4</span>

</td>

<td>

<span>a</span>

</td>

<td>

<span>1</span>

</td>

<td>

<span>0.492585231550038</span>

</td>

<td>

<span>100000</span>

</td>

<td>

<span>100</span>

</td>

</tr>

<tr>

<td>

<span>2</span>

</td>

<td>

<span>9</span>

</td>

<td>

<span>-3</span>

</td>

<td>

<span>b</span>

</td>

<td>

<span>NA</span>

</td>

<td>

<span>0.76806613872759</span>

</td>

<td>

<span>100001</span>

</td>

<td>

<span>200</span>

</td>

</tr>

<tr>

<td>

<span>3</span>

</td>

<td>

<span>8</span>

</td>

<td>

<span>-2</span>

</td>

<td>

<span>c</span>

</td>

<td>

<span>2</span>

</td>

<td>

<span>0.348551977192983</span>

</td>

<td>

<span>100002</span>

</td>

<td>

<span>-100</span>

</td>

</tr>

<tr>

<td>

<span>4</span>

</td>

<td>

<span>7</span>

</td>

<td>

<span>-1</span>

</td>

<td>

<span>d</span>

</td>

<td>

<span>NA</span>

</td>

<td>

<span>0.771511870902032</span>

</td>

<td>

<span>100003</span>

</td>

<td>

<span>-200</span>

</td>

</tr>

<tr>

<td>

<span>5</span>

</td>

<td>

<span>6</span>

</td>

<td>

<span>0</span>

</td>

<td>

<span>e</span>

</td>

<td>

<span>3</span>

</td>

<td>

<span>0.141470255097374</span>

</td>

<td>

<span>100004</span>

</td>

<td>

<span>1000.11</span>

</td>

</tr>

<tr>

<td>

<span>6</span>

</td>

<td>

<span>5</span>

</td>

<td>

<span>1</span>

</td>

<td>

<span>f</span>

</td>

<td>

<span>NA</span>

</td>

<td>

<span>0.775738270487636</span>

</td>

<td>

<span>100005</span>

</td>

<td>

<span>2000.22</span>

</td>

</tr>

<tr>

<td>

<span>7</span>

</td>

<td>

<span>4</span>

</td>

<td>

<span>2</span>

</td>

<td>

<span>g</span>

</td>

<td>

<span>4</span>

</td>

<td>

<span>0.626521660713479</span>

</td>

<td>

<span>100006</span>

</td>

<td>

<span>-1000.11</span>

</td>

</tr>

<tr>

<td>

<span>8</span>

</td>

<td>

<span>3</span>

</td>

<td>

<span>3</span>

</td>

<td>

<span>h</span>

</td>

<td>

<span>NA</span>

</td>

<td>

<span>0.0925577846355736</span>

</td>

<td>

<span>100007</span>

</td>

<td>

<span>-2000.22</span>

</td>

</tr>

<tr>

<td>

<span>9</span>

</td>

<td>

<span>2</span>

</td>

<td>

<span>4</span>

</td>

<td>

<span>i</span>

</td>

<td>

<span>5</span>

</td>

<td>

<span>0.405598992016166</span>

</td>

<td>

<span>100008</span>

</td>

<td>

<span>0</span>

</td>

</tr>

<tr>

<td>

<span>10</span>

</td>

<td>

<span>1</span>

</td>

<td>

<span>5</span>

</td>

<td>

<span>j</span>

</td>

<td>

<span>NA</span>

</td>

<td>

<span>0.289630953222513</span>

</td>

<td>

<span>100009</span>

</td>

<td>

<span>0.11</span>

</td>

</tr>

</tbody>

</table>

### Format a column

3 types of numeric text formatting is supported:

  - Percent
  - Comma
  - Dollar

<!-- end list -->

``` r
ht$col_pct_fmt(6)
ht$col_comma_fmt(7)
ht$col_dollar_fmt(8)
```

Since `ht` is a reference class object each formatting operation is done
in place.

``` r
ht$Rmd()
```

<table style="margin-left:auto;margin-right:auto;">

<thead>

<tr>

<th>

<span>A</span>

</th>

<th>

<span>B</span>

</th>

<th>

<span>C</span>

</th>

<th>

<span>D</span>

</th>

<th>

<span>E</span>

</th>

<th>

<span>Pct</span>

</th>

<th>

<span>Big</span>

</th>

<th>

<span>Money</span>

</th>

</tr>

</thead>

<tbody>

<tr>

<td>

<span>1</span>

</td>

<td>

<span>10</span>

</td>

<td>

<span>-4</span>

</td>

<td>

<span>a</span>

</td>

<td>

<span>1</span>

</td>

<td>

<span>49.26%</span>

</td>

<td>

<span>100,000</span>

</td>

<td>

<span>$ 100.00</span>

</td>

</tr>

<tr>

<td>

<span>2</span>

</td>

<td>

<span>9</span>

</td>

<td>

<span>-3</span>

</td>

<td>

<span>b</span>

</td>

<td>

<span>NA</span>

</td>

<td>

<span>76.81%</span>

</td>

<td>

<span>100,001</span>

</td>

<td>

<span>$ 200.00</span>

</td>

</tr>

<tr>

<td>

<span>3</span>

</td>

<td>

<span>8</span>

</td>

<td>

<span>-2</span>

</td>

<td>

<span>c</span>

</td>

<td>

<span>2</span>

</td>

<td>

<span>34.86%</span>

</td>

<td>

<span>100,002</span>

</td>

<td>

<span>$ -100.00</span>

</td>

</tr>

<tr>

<td>

<span>4</span>

</td>

<td>

<span>7</span>

</td>

<td>

<span>-1</span>

</td>

<td>

<span>d</span>

</td>

<td>

<span>NA</span>

</td>

<td>

<span>77.15%</span>

</td>

<td>

<span>100,003</span>

</td>

<td>

<span>$ -200.00</span>

</td>

</tr>

<tr>

<td>

<span>5</span>

</td>

<td>

<span>6</span>

</td>

<td>

<span>0</span>

</td>

<td>

<span>e</span>

</td>

<td>

<span>3</span>

</td>

<td>

<span>14.15%</span>

</td>

<td>

<span>100,004</span>

</td>

<td>

<span>$ 1,000.11</span>

</td>

</tr>

<tr>

<td>

<span>6</span>

</td>

<td>

<span>5</span>

</td>

<td>

<span>1</span>

</td>

<td>

<span>f</span>

</td>

<td>

<span>NA</span>

</td>

<td>

<span>77.57%</span>

</td>

<td>

<span>100,005</span>

</td>

<td>

<span>$
2,000.22</span>

</td>

</tr>

<tr>

<td>

<span>7</span>

</td>

<td>

<span>4</span>

</td>

<td>

<span>2</span>

</td>

<td>

<span>g</span>

</td>

<td>

<span>4</span>

</td>

<td>

<span>62.65%</span>

</td>

<td>

<span>100,006</span>

</td>

<td>

<span>\(-1,000.11</span></td></tr><tr><td><span>8</span></td><td><span>3</span></td><td><span>3</span></td><td><span>h</span></td><td><span>NA</span></td><td><span>9.26%</span></td><td><span>100,007</span></td><td><span>\)-2,000.22</span>

</td>

</tr>

<tr>

<td>

<span>9</span>

</td>

<td>

<span>2</span>

</td>

<td>

<span>4</span>

</td>

<td>

<span>i</span>

</td>

<td>

<span>5</span>

</td>

<td>

<span>40.56%</span>

</td>

<td>

<span>100,008</span>

</td>

<td>

<span>$ 0.00</span>

</td>

</tr>

<tr>

<td>

<span>10</span>

</td>

<td>

<span>1</span>

</td>

<td>

<span>5</span>

</td>

<td>

<span>j</span>

</td>

<td>

<span>NA</span>

</td>

<td>

<span>28.96%</span>

</td>

<td>

<span>100,009</span>

</td>

<td>

<span>$ 0.11</span>

</td>

</tr>

</tbody>

</table>

These operations change the field `contents`. This matrix is what is
used to get the content for each HTML table cell.

``` r
ht$contents
#>       A                 B                 C                
#>  [1,] "<span>A</span>"  "<span>B</span>"  "<span>C</span>" 
#>  [2,] "<span>1</span>"  "<span>10</span>" "<span>-4</span>"
#>  [3,] "<span>2</span>"  "<span>9</span>"  "<span>-3</span>"
#>  [4,] "<span>3</span>"  "<span>8</span>"  "<span>-2</span>"
#>  [5,] "<span>4</span>"  "<span>7</span>"  "<span>-1</span>"
#>  [6,] "<span>5</span>"  "<span>6</span>"  "<span>0</span>" 
#>  [7,] "<span>6</span>"  "<span>5</span>"  "<span>1</span>" 
#>  [8,] "<span>7</span>"  "<span>4</span>"  "<span>2</span>" 
#>  [9,] "<span>8</span>"  "<span>3</span>"  "<span>3</span>" 
#> [10,] "<span>9</span>"  "<span>2</span>"  "<span>4</span>" 
#> [11,] "<span>10</span>" "<span>1</span>"  "<span>5</span>" 
#>       D                E                 Pct                  
#>  [1,] "<span>D</span>" "<span>E</span>"  "<span>Pct</span>"   
#>  [2,] "<span>a</span>" "<span>1</span>"  "<span>49.26%</span>"
#>  [3,] "<span>b</span>" "<span>NA</span>" "<span>76.81%</span>"
#>  [4,] "<span>c</span>" "<span>2</span>"  "<span>34.86%</span>"
#>  [5,] "<span>d</span>" "<span>NA</span>" "<span>77.15%</span>"
#>  [6,] "<span>e</span>" "<span>3</span>"  "<span>14.15%</span>"
#>  [7,] "<span>f</span>" "<span>NA</span>" "<span>77.57%</span>"
#>  [8,] "<span>g</span>" "<span>4</span>"  "<span>62.65%</span>"
#>  [9,] "<span>h</span>" "<span>NA</span>" "<span>9.26%</span>" 
#> [10,] "<span>i</span>" "<span>5</span>"  "<span>40.56%</span>"
#> [11,] "<span>j</span>" "<span>NA</span>" "<span>28.96%</span>"
#>       Big                    Money                    
#>  [1,] "<span>Big</span>"     "<span>Money</span>"     
#>  [2,] "<span>100,000</span>" "<span>$   100.00</span>"
#>  [3,] "<span>100,001</span>" "<span>$   200.00</span>"
#>  [4,] "<span>100,002</span>" "<span>$  -100.00</span>"
#>  [5,] "<span>100,003</span>" "<span>$  -200.00</span>"
#>  [6,] "<span>100,004</span>" "<span>$ 1,000.11</span>"
#>  [7,] "<span>100,005</span>" "<span>$ 2,000.22</span>"
#>  [8,] "<span>100,006</span>" "<span>$-1,000.11</span>"
#>  [9,] "<span>100,007</span>" "<span>$-2,000.22</span>"
#> [10,] "<span>100,008</span>" "<span>$     0.00</span>"
#> [11,] "<span>100,009</span>" "<span>$     0.11</span>"
```
