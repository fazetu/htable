
<!-- README.md is generated from README.Rmd. Please edit that file -->

# htable

The goal of htable is to easily and transparently translate R
data.frames into styled HTML tables.

## Installation

Make sure to build with vignettes to view examples of styling the
tables.

``` r
# install.packages("devtools")
devtools::install_github("fazetu/htable", build_vignettes = TRUE)
```

## Examples

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
#> [1] "<table style='margin-left:auto;margin-right:auto;'><thead><tr><th><div>A</div></th><th><div>B</div></th><th><div>C</div></th><th><div>D</div></th><th><div>E</div></th><th><div>Pct</div></th><th><div>Big</div></th><th><div>Money</div></th></tr></thead><tbody><tr><td><div>1</div></td><td><div>10</div></td><td><div>-4</div></td><td><div>a</div></td><td><div>1</div></td><td><div>0.98766976268962</div></td><td><div>100000</div></td><td><div>100</div></td></tr><tr><td><div>2</div></td><td><div>9</div></td><td><div>-3</div></td><td><div>b</div></td><td><div>NA</div></td><td><div>0.83207360515371</div></td><td><div>100001</div></td><td><div>200</div></td></tr><tr><td><div>3</div></td><td><div>8</div></td><td><div>-2</div></td><td><div>c</div></td><td><div>2</div></td><td><div>0.313282870454714</div></td><td><div>100002</div></td><td><div>-100</div></td></tr><tr><td><div>4</div></td><td><div>7</div></td><td><div>-1</div></td><td><div>d</div></td><td><div>NA</div></td><td><div>0.487539564725012</div></td><td><div>100003</div></td><td><div>-200</div></td></tr><tr><td><div>5</div></td><td><div>6</div></td><td><div>0</div></td><td><div>e</div></td><td><div>3</div></td><td><div>0.233070042915642</div></td><td><div>100004</div></td><td><div>1000.11</div></td></tr><tr><td><div>6</div></td><td><div>5</div></td><td><div>1</div></td><td><div>f</div></td><td><div>NA</div></td><td><div>0.515593397431076</div></td><td><div>100005</div></td><td><div>2000.22</div></td></tr><tr><td><div>7</div></td><td><div>4</div></td><td><div>2</div></td><td><div>g</div></td><td><div>4</div></td><td><div>0.0739094286691397</div></td><td><div>100006</div></td><td><div>-1000.11</div></td></tr><tr><td><div>8</div></td><td><div>3</div></td><td><div>3</div></td><td><div>h</div></td><td><div>NA</div></td><td><div>0.552099404623732</div></td><td><div>100007</div></td><td><div>-2000.22</div></td></tr><tr><td><div>9</div></td><td><div>2</div></td><td><div>4</div></td><td><div>i</div></td><td><div>5</div></td><td><div>0.715031072264537</div></td><td><div>100008</div></td><td><div>0</div></td></tr><tr><td><div>10</div></td><td><div>1</div></td><td><div>5</div></td><td><div>j</div></td><td><div>NA</div></td><td><div>0.521291874814779</div></td><td><div>100009</div></td><td><div>0.11</div></td></tr></tbody></table>"
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

<div>

A

</div>

</th>

<th>

<div>

B

</div>

</th>

<th>

<div>

C

</div>

</th>

<th>

<div>

D

</div>

</th>

<th>

<div>

E

</div>

</th>

<th>

<div>

Pct

</div>

</th>

<th>

<div>

Big

</div>

</th>

<th>

<div>

Money

</div>

</th>

</tr>

</thead>

<tbody>

<tr>

<td>

<div>

1

</div>

</td>

<td>

<div>

10

</div>

</td>

<td>

<div>

\-4

</div>

</td>

<td>

<div>

a

</div>

</td>

<td>

<div>

1

</div>

</td>

<td>

<div>

0.98766976268962

</div>

</td>

<td>

<div>

100000

</div>

</td>

<td>

<div>

100

</div>

</td>

</tr>

<tr>

<td>

<div>

2

</div>

</td>

<td>

<div>

9

</div>

</td>

<td>

<div>

\-3

</div>

</td>

<td>

<div>

b

</div>

</td>

<td>

<div>

NA

</div>

</td>

<td>

<div>

0.83207360515371

</div>

</td>

<td>

<div>

100001

</div>

</td>

<td>

<div>

200

</div>

</td>

</tr>

<tr>

<td>

<div>

3

</div>

</td>

<td>

<div>

8

</div>

</td>

<td>

<div>

\-2

</div>

</td>

<td>

<div>

c

</div>

</td>

<td>

<div>

2

</div>

</td>

<td>

<div>

0.313282870454714

</div>

</td>

<td>

<div>

100002

</div>

</td>

<td>

<div>

\-100

</div>

</td>

</tr>

<tr>

<td>

<div>

4

</div>

</td>

<td>

<div>

7

</div>

</td>

<td>

<div>

\-1

</div>

</td>

<td>

<div>

d

</div>

</td>

<td>

<div>

NA

</div>

</td>

<td>

<div>

0.487539564725012

</div>

</td>

<td>

<div>

100003

</div>

</td>

<td>

<div>

\-200

</div>

</td>

</tr>

<tr>

<td>

<div>

5

</div>

</td>

<td>

<div>

6

</div>

</td>

<td>

<div>

0

</div>

</td>

<td>

<div>

e

</div>

</td>

<td>

<div>

3

</div>

</td>

<td>

<div>

0.233070042915642

</div>

</td>

<td>

<div>

100004

</div>

</td>

<td>

<div>

1000.11

</div>

</td>

</tr>

<tr>

<td>

<div>

6

</div>

</td>

<td>

<div>

5

</div>

</td>

<td>

<div>

1

</div>

</td>

<td>

<div>

f

</div>

</td>

<td>

<div>

NA

</div>

</td>

<td>

<div>

0.515593397431076

</div>

</td>

<td>

<div>

100005

</div>

</td>

<td>

<div>

2000.22

</div>

</td>

</tr>

<tr>

<td>

<div>

7

</div>

</td>

<td>

<div>

4

</div>

</td>

<td>

<div>

2

</div>

</td>

<td>

<div>

g

</div>

</td>

<td>

<div>

4

</div>

</td>

<td>

<div>

0.0739094286691397

</div>

</td>

<td>

<div>

100006

</div>

</td>

<td>

<div>

\-1000.11

</div>

</td>

</tr>

<tr>

<td>

<div>

8

</div>

</td>

<td>

<div>

3

</div>

</td>

<td>

<div>

3

</div>

</td>

<td>

<div>

h

</div>

</td>

<td>

<div>

NA

</div>

</td>

<td>

<div>

0.552099404623732

</div>

</td>

<td>

<div>

100007

</div>

</td>

<td>

<div>

\-2000.22

</div>

</td>

</tr>

<tr>

<td>

<div>

9

</div>

</td>

<td>

<div>

2

</div>

</td>

<td>

<div>

4

</div>

</td>

<td>

<div>

i

</div>

</td>

<td>

<div>

5

</div>

</td>

<td>

<div>

0.715031072264537

</div>

</td>

<td>

<div>

100008

</div>

</td>

<td>

<div>

0

</div>

</td>

</tr>

<tr>

<td>

<div>

10

</div>

</td>

<td>

<div>

1

</div>

</td>

<td>

<div>

5

</div>

</td>

<td>

<div>

j

</div>

</td>

<td>

<div>

NA

</div>

</td>

<td>

<div>

0.521291874814779

</div>

</td>

<td>

<div>

100009

</div>

</td>

<td>

<div>

0.11

</div>

</td>

</tr>

</tbody>

</table>

When not working in an RMarkdown file, use the `View()` method to see
the rendered HTML table.

``` r
ht$View()
```

For examples on how to style the tables, see the
vignette.

<!-- Originally tried to include styles here, but github did not render the styled HTML tables -->

``` r
vignette("htable", package = "htable")
```
