
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
#> [1] "<table style='margin-left:auto;margin-right:auto;'><thead><tr><th><div>A</div></th><th><div>B</div></th><th><div>C</div></th><th><div>D</div></th><th><div>E</div></th><th><div>Pct</div></th><th><div>Big</div></th><th><div>Money</div></th></tr></thead><tbody><tr><td><div>1</div></td><td><div>10</div></td><td><div>-4</div></td><td><div>a</div></td><td><div>1</div></td><td><div>0.127570638665929</div></td><td><div>100000</div></td><td><div>100</div></td></tr><tr><td><div>2</div></td><td><div>9</div></td><td><div>-3</div></td><td><div>b</div></td><td><div>NA</div></td><td><div>0.323635782115161</div></td><td><div>100001</div></td><td><div>200</div></td></tr><tr><td><div>3</div></td><td><div>8</div></td><td><div>-2</div></td><td><div>c</div></td><td><div>2</div></td><td><div>0.481478109257296</div></td><td><div>100002</div></td><td><div>-100</div></td></tr><tr><td><div>4</div></td><td><div>7</div></td><td><div>-1</div></td><td><div>d</div></td><td><div>NA</div></td><td><div>0.148341480176896</div></td><td><div>100003</div></td><td><div>-200</div></td></tr><tr><td><div>5</div></td><td><div>6</div></td><td><div>0</div></td><td><div>e</div></td><td><div>3</div></td><td><div>0.167925755726174</div></td><td><div>100004</div></td><td><div>1000.11</div></td></tr><tr><td><div>6</div></td><td><div>5</div></td><td><div>1</div></td><td><div>f</div></td><td><div>NA</div></td><td><div>0.305551076540723</div></td><td><div>100005</div></td><td><div>2000.22</div></td></tr><tr><td><div>7</div></td><td><div>4</div></td><td><div>2</div></td><td><div>g</div></td><td><div>4</div></td><td><div>0.857581724179909</div></td><td><div>100006</div></td><td><div>-1000.11</div></td></tr><tr><td><div>8</div></td><td><div>3</div></td><td><div>3</div></td><td><div>h</div></td><td><div>NA</div></td><td><div>0.00823652977123857</div></td><td><div>100007</div></td><td><div>-2000.22</div></td></tr><tr><td><div>9</div></td><td><div>2</div></td><td><div>4</div></td><td><div>i</div></td><td><div>5</div></td><td><div>0.057619197294116</div></td><td><div>100008</div></td><td><div>0</div></td></tr><tr><td><div>10</div></td><td><div>1</div></td><td><div>5</div></td><td><div>j</div></td><td><div>NA</div></td><td><div>0.492289293091744</div></td><td><div>100009</div></td><td><div>0.11</div></td></tr></tbody></table>"
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

0.127570638665929

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

0.323635782115161

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

0.481478109257296

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

0.148341480176896

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

0.167925755726174

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

0.305551076540723

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

0.857581724179909

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

0.00823652977123857

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

0.057619197294116

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

0.492289293091744

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

12.76%

</div>

</td>

<td>

<div>

100,000

</div>

</td>

<td>

<div>

$ 100.00

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

32.36%

</div>

</td>

<td>

<div>

100,001

</div>

</td>

<td>

<div>

$ 200.00

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

48.15%

</div>

</td>

<td>

<div>

100,002

</div>

</td>

<td>

<div>

$ -100.00

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

14.83%

</div>

</td>

<td>

<div>

100,003

</div>

</td>

<td>

<div>

$ -200.00

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

16.79%

</div>

</td>

<td>

<div>

100,004

</div>

</td>

<td>

<div>

$ 1,000.11

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

30.56%

</div>

</td>

<td>

<div>

100,005

</div>

</td>

<td>

<div>

$
2,000.22

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

85.76%

</div>

</td>

<td>

<div>

100,006

</div>

</td>

<td>

<div>

\(-1,000.11</div></td></tr><tr><td><div>8</div></td><td><div>3</div></td><td><div>3</div></td><td><div>h</div></td><td><div>NA</div></td><td><div>0.82%</div></td><td><div>100,007</div></td><td><div>\)-2,000.22

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

5.76%

</div>

</td>

<td>

<div>

100,008

</div>

</td>

<td>

<div>

$ 0.00

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

49.23%

</div>

</td>

<td>

<div>

100,009

</div>

</td>

<td>

<div>

$ 0.11

</div>

</td>

</tr>

</tbody>

</table>

These operations change the `contents` field of `ht`. This matrix is
what is used to get the content for each HTML table cell.

### Style columns

This demonstrates many of the available column styles. All available
column stylings start with the prefix “col\_”.

``` r
ht$col_bg_color(1, "red", include_header = TRUE)
ht$col_color(1, "white", include_header = TRUE)
ht$col_bold(2)
ht$col_italic(3)
ht$col_color_scale(6)
ht$col_data_bar(8)
ht$Rmd()
```

<table style="margin-left:auto;margin-right:auto;">

<thead>

<tr>

<th style="background-color:red;color:white;">

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

<td style="background-color:red;color:white;">

<div>

1

</div>

</td>

<td style="font-weight:bold;">

<div>

10

</div>

</td>

<td style="font-style:italic;">

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

<div style="border-radius:0;padding-right:0;background-color:#8ECA7D;width:100%;">

12.76%

</div>

</td>

<td>

<div>

100,000

</div>

</td>

<td>

<div style="white-space:nowrap;direction:ltr;border-radius:4px;padding-right:2px;background-color:lightgreen;width:5.00%;">

$
100.00

</div>

</td>

</tr>

<tr>

<td style="background-color:red;color:white;">

<div>

2

</div>

</td>

<td style="font-weight:bold;">

<div>

9

</div>

</td>

<td style="font-style:italic;">

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

<div style="border-radius:0;padding-right:0;background-color:#D6DF81;width:100%;">

32.36%

</div>

</td>

<td>

<div>

100,001

</div>

</td>

<td>

<div style="white-space:nowrap;direction:ltr;border-radius:4px;padding-right:2px;background-color:lightgreen;width:10.00%;">

$
200.00

</div>

</td>

</tr>

<tr>

<td style="background-color:red;color:white;">

<div>

3

</div>

</td>

<td style="font-weight:bold;">

<div>

8

</div>

</td>

<td style="font-style:italic;">

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

<div style="border-radius:0;padding-right:0;background-color:#FEDC81;width:100%;">

48.15%

</div>

</td>

<td>

<div>

100,002

</div>

</td>

<td>

<div style="white-space:nowrap;direction:ltr;border-radius:4px;padding-right:2px;background-color:lightgreen;width:-5.00%;">

$
-100.00

</div>

</td>

</tr>

<tr>

<td style="background-color:red;color:white;">

<div>

4

</div>

</td>

<td style="font-weight:bold;">

<div>

7

</div>

</td>

<td style="font-style:italic;">

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

<div style="border-radius:0;padding-right:0;background-color:#96CC7D;width:100%;">

14.83%

</div>

</td>

<td>

<div>

100,003

</div>

</td>

<td>

<div style="white-space:nowrap;direction:ltr;border-radius:4px;padding-right:2px;background-color:lightgreen;width:-10.00%;">

$
-200.00

</div>

</td>

</tr>

<tr>

<td style="background-color:red;color:white;">

<div>

5

</div>

</td>

<td style="font-weight:bold;">

<div>

6

</div>

</td>

<td style="font-style:italic;">

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

<div style="border-radius:0;padding-right:0;background-color:#9DCE7E;width:100%;">

16.79%

</div>

</td>

<td>

<div>

100,004

</div>

</td>

<td>

<div style="white-space:nowrap;direction:ltr;border-radius:4px;padding-right:2px;background-color:lightgreen;width:50.00%;">

$
1,000.11

</div>

</td>

</tr>

<tr>

<td style="background-color:red;color:white;">

<div>

6

</div>

</td>

<td style="font-weight:bold;">

<div>

5

</div>

</td>

<td style="font-style:italic;">

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

<div style="border-radius:0;padding-right:0;background-color:#D0DD81;width:100%;">

30.56%

</div>

</td>

<td>

<div>

100,005

</div>

</td>

<td>

<div style="white-space:nowrap;direction:ltr;border-radius:4px;padding-right:2px;background-color:lightgreen;width:100.00%;">

$
2,000.22

</div>

</td>

</tr>

<tr>

<td style="background-color:red;color:white;">

<div>

7

</div>

</td>

<td style="font-weight:bold;">

<div>

4

</div>

</td>

<td style="font-style:italic;">

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

<div style="border-radius:0;padding-right:0;background-color:#F8696B;width:100%;">

85.76%

</div>

</td>

<td>

<div>

100,006

</div>

</td>

<td>

<div style="white-space:nowrap;direction:ltr;border-radius:4px;padding-right:2px;background-color:lightgreen;width:-50.00%;">

\(-1,000.11</div></td></tr><tr><td style='background-color:red;color:white;'><div>8</div></td><td style='font-weight:bold;'><div>3</div></td><td style='font-style:italic;'><div>3</div></td><td><div>h</div></td><td><div>NA</div></td><td><div style='border-radius:0;padding-right:0;background-color:#63BE7B;width:100%;'>0.82%</div></td><td><div>100,007</div></td><td><div style='white-space:nowrap;direction:ltr;border-radius:4px;padding-right:2px;background-color:lightgreen;width:-100.00%;'>\)-2,000.22

</div>

</td>

</tr>

<tr>

<td style="background-color:red;color:white;">

<div>

9

</div>

</td>

<td style="font-weight:bold;">

<div>

2

</div>

</td>

<td style="font-style:italic;">

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

<div style="border-radius:0;padding-right:0;background-color:#75C37C;width:100%;">

5.76%

</div>

</td>

<td>

<div>

100,008

</div>

</td>

<td>

<div style="white-space:nowrap;direction:ltr;border-radius:4px;padding-right:2px;background-color:lightgreen;width:0.00%;">

$
0.00

</div>

</td>

</tr>

<tr>

<td style="background-color:red;color:white;">

<div>

10

</div>

</td>

<td style="font-weight:bold;">

<div>

1

</div>

</td>

<td style="font-style:italic;">

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

<div style="border-radius:0;padding-right:0;background-color:#FED880;width:100%;">

49.23%

</div>

</td>

<td>

<div>

100,009

</div>

</td>

<td>

<div style="white-space:nowrap;direction:ltr;border-radius:4px;padding-right:2px;background-color:lightgreen;width:0.01%;">

$ 0.11

</div>

</td>

</tr>

</tbody>

</table>

These operations change the `styles` field of `ht`. This matrix is what
is used to apply styles to each `<th>` and `<td>` tag of the HTML table.

### Reset styles and contents

To start with a clean slate of styles:

``` r
ht$clear_styles()
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

<div style="border-radius:0;padding-right:0;background-color:#8ECA7D;width:100%;">

12.76%

</div>

</td>

<td>

<div>

100,000

</div>

</td>

<td>

<div style="white-space:nowrap;direction:ltr;border-radius:4px;padding-right:2px;background-color:lightgreen;width:5.00%;">

$
100.00

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

<div style="border-radius:0;padding-right:0;background-color:#D6DF81;width:100%;">

32.36%

</div>

</td>

<td>

<div>

100,001

</div>

</td>

<td>

<div style="white-space:nowrap;direction:ltr;border-radius:4px;padding-right:2px;background-color:lightgreen;width:10.00%;">

$
200.00

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

<div style="border-radius:0;padding-right:0;background-color:#FEDC81;width:100%;">

48.15%

</div>

</td>

<td>

<div>

100,002

</div>

</td>

<td>

<div style="white-space:nowrap;direction:ltr;border-radius:4px;padding-right:2px;background-color:lightgreen;width:-5.00%;">

$
-100.00

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

<div style="border-radius:0;padding-right:0;background-color:#96CC7D;width:100%;">

14.83%

</div>

</td>

<td>

<div>

100,003

</div>

</td>

<td>

<div style="white-space:nowrap;direction:ltr;border-radius:4px;padding-right:2px;background-color:lightgreen;width:-10.00%;">

$
-200.00

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

<div style="border-radius:0;padding-right:0;background-color:#9DCE7E;width:100%;">

16.79%

</div>

</td>

<td>

<div>

100,004

</div>

</td>

<td>

<div style="white-space:nowrap;direction:ltr;border-radius:4px;padding-right:2px;background-color:lightgreen;width:50.00%;">

$
1,000.11

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

<div style="border-radius:0;padding-right:0;background-color:#D0DD81;width:100%;">

30.56%

</div>

</td>

<td>

<div>

100,005

</div>

</td>

<td>

<div style="white-space:nowrap;direction:ltr;border-radius:4px;padding-right:2px;background-color:lightgreen;width:100.00%;">

$
2,000.22

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

<div style="border-radius:0;padding-right:0;background-color:#F8696B;width:100%;">

85.76%

</div>

</td>

<td>

<div>

100,006

</div>

</td>

<td>

<div style="white-space:nowrap;direction:ltr;border-radius:4px;padding-right:2px;background-color:lightgreen;width:-50.00%;">

\(-1,000.11</div></td></tr><tr><td><div>8</div></td><td><div>3</div></td><td><div>3</div></td><td><div>h</div></td><td><div>NA</div></td><td><div style='border-radius:0;padding-right:0;background-color:#63BE7B;width:100%;'>0.82%</div></td><td><div>100,007</div></td><td><div style='white-space:nowrap;direction:ltr;border-radius:4px;padding-right:2px;background-color:lightgreen;width:-100.00%;'>\)-2,000.22

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

<div style="border-radius:0;padding-right:0;background-color:#75C37C;width:100%;">

5.76%

</div>

</td>

<td>

<div>

100,008

</div>

</td>

<td>

<div style="white-space:nowrap;direction:ltr;border-radius:4px;padding-right:2px;background-color:lightgreen;width:0.00%;">

$
0.00

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

<div style="border-radius:0;padding-right:0;background-color:#FED880;width:100%;">

49.23%

</div>

</td>

<td>

<div>

100,009

</div>

</td>

<td>

<div style="white-space:nowrap;direction:ltr;border-radius:4px;padding-right:2px;background-color:lightgreen;width:0.01%;">

$ 0.11

</div>

</td>

</tr>

</tbody>

</table>

This clears the `styles` field of `ht`. There is also a similar
`clear_all_styles()` method. This also clears `table_style`,
`thead_style`, `tbody_style`, and `tr_styles` fields of `ht`.

To start with a clean slate of contents:

``` r
ht$reset_contents()
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

0.127570638665929

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

0.323635782115161

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

0.481478109257296

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

0.148341480176896

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

0.167925755726174

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

0.305551076540723

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

0.857581724179909

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

0.00823652977123857

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

0.057619197294116

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

0.492289293091744

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

This resets the `contents` field of `ht`.

### Style rows

This demonstrates many of the avialable row and header styles. All
available row styles start with the prefix “row\_” and all available
header styles start with “header\_”.

Add an alternating text and background color:

``` r
# first colors apply to odd rows and second color applies to even rows
ht$row_alt_color("white", "black", include_header = TRUE)
ht$row_alt_bg_color("black", "orange", include_header = TRUE)
ht$Rmd()
```

<table style="margin-left:auto;margin-right:auto;">

<thead>

<tr>

<th style="color:white;background-color:black;">

<div>

A

</div>

</th>

<th style="color:white;background-color:black;">

<div>

B

</div>

</th>

<th style="color:white;background-color:black;">

<div>

C

</div>

</th>

<th style="color:white;background-color:black;">

<div>

D

</div>

</th>

<th style="color:white;background-color:black;">

<div>

E

</div>

</th>

<th style="color:white;background-color:black;">

<div>

Pct

</div>

</th>

<th style="color:white;background-color:black;">

<div>

Big

</div>

</th>

<th style="color:white;background-color:black;">

<div>

Money

</div>

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="color:black;background-color:orange;">

<div>

1

</div>

</td>

<td style="color:black;background-color:orange;">

<div>

10

</div>

</td>

<td style="color:black;background-color:orange;">

<div>

\-4

</div>

</td>

<td style="color:black;background-color:orange;">

<div>

a

</div>

</td>

<td style="color:black;background-color:orange;">

<div>

1

</div>

</td>

<td style="color:black;background-color:orange;">

<div>

0.127570638665929

</div>

</td>

<td style="color:black;background-color:orange;">

<div>

100000

</div>

</td>

<td style="color:black;background-color:orange;">

<div>

100

</div>

</td>

</tr>

<tr>

<td style="color:white;background-color:black;">

<div>

2

</div>

</td>

<td style="color:white;background-color:black;">

<div>

9

</div>

</td>

<td style="color:white;background-color:black;">

<div>

\-3

</div>

</td>

<td style="color:white;background-color:black;">

<div>

b

</div>

</td>

<td style="color:white;background-color:black;">

<div>

NA

</div>

</td>

<td style="color:white;background-color:black;">

<div>

0.323635782115161

</div>

</td>

<td style="color:white;background-color:black;">

<div>

100001

</div>

</td>

<td style="color:white;background-color:black;">

<div>

200

</div>

</td>

</tr>

<tr>

<td style="color:black;background-color:orange;">

<div>

3

</div>

</td>

<td style="color:black;background-color:orange;">

<div>

8

</div>

</td>

<td style="color:black;background-color:orange;">

<div>

\-2

</div>

</td>

<td style="color:black;background-color:orange;">

<div>

c

</div>

</td>

<td style="color:black;background-color:orange;">

<div>

2

</div>

</td>

<td style="color:black;background-color:orange;">

<div>

0.481478109257296

</div>

</td>

<td style="color:black;background-color:orange;">

<div>

100002

</div>

</td>

<td style="color:black;background-color:orange;">

<div>

\-100

</div>

</td>

</tr>

<tr>

<td style="color:white;background-color:black;">

<div>

4

</div>

</td>

<td style="color:white;background-color:black;">

<div>

7

</div>

</td>

<td style="color:white;background-color:black;">

<div>

\-1

</div>

</td>

<td style="color:white;background-color:black;">

<div>

d

</div>

</td>

<td style="color:white;background-color:black;">

<div>

NA

</div>

</td>

<td style="color:white;background-color:black;">

<div>

0.148341480176896

</div>

</td>

<td style="color:white;background-color:black;">

<div>

100003

</div>

</td>

<td style="color:white;background-color:black;">

<div>

\-200

</div>

</td>

</tr>

<tr>

<td style="color:black;background-color:orange;">

<div>

5

</div>

</td>

<td style="color:black;background-color:orange;">

<div>

6

</div>

</td>

<td style="color:black;background-color:orange;">

<div>

0

</div>

</td>

<td style="color:black;background-color:orange;">

<div>

e

</div>

</td>

<td style="color:black;background-color:orange;">

<div>

3

</div>

</td>

<td style="color:black;background-color:orange;">

<div>

0.167925755726174

</div>

</td>

<td style="color:black;background-color:orange;">

<div>

100004

</div>

</td>

<td style="color:black;background-color:orange;">

<div>

1000.11

</div>

</td>

</tr>

<tr>

<td style="color:white;background-color:black;">

<div>

6

</div>

</td>

<td style="color:white;background-color:black;">

<div>

5

</div>

</td>

<td style="color:white;background-color:black;">

<div>

1

</div>

</td>

<td style="color:white;background-color:black;">

<div>

f

</div>

</td>

<td style="color:white;background-color:black;">

<div>

NA

</div>

</td>

<td style="color:white;background-color:black;">

<div>

0.305551076540723

</div>

</td>

<td style="color:white;background-color:black;">

<div>

100005

</div>

</td>

<td style="color:white;background-color:black;">

<div>

2000.22

</div>

</td>

</tr>

<tr>

<td style="color:black;background-color:orange;">

<div>

7

</div>

</td>

<td style="color:black;background-color:orange;">

<div>

4

</div>

</td>

<td style="color:black;background-color:orange;">

<div>

2

</div>

</td>

<td style="color:black;background-color:orange;">

<div>

g

</div>

</td>

<td style="color:black;background-color:orange;">

<div>

4

</div>

</td>

<td style="color:black;background-color:orange;">

<div>

0.857581724179909

</div>

</td>

<td style="color:black;background-color:orange;">

<div>

100006

</div>

</td>

<td style="color:black;background-color:orange;">

<div>

\-1000.11

</div>

</td>

</tr>

<tr>

<td style="color:white;background-color:black;">

<div>

8

</div>

</td>

<td style="color:white;background-color:black;">

<div>

3

</div>

</td>

<td style="color:white;background-color:black;">

<div>

3

</div>

</td>

<td style="color:white;background-color:black;">

<div>

h

</div>

</td>

<td style="color:white;background-color:black;">

<div>

NA

</div>

</td>

<td style="color:white;background-color:black;">

<div>

0.00823652977123857

</div>

</td>

<td style="color:white;background-color:black;">

<div>

100007

</div>

</td>

<td style="color:white;background-color:black;">

<div>

\-2000.22

</div>

</td>

</tr>

<tr>

<td style="color:black;background-color:orange;">

<div>

9

</div>

</td>

<td style="color:black;background-color:orange;">

<div>

2

</div>

</td>

<td style="color:black;background-color:orange;">

<div>

4

</div>

</td>

<td style="color:black;background-color:orange;">

<div>

i

</div>

</td>

<td style="color:black;background-color:orange;">

<div>

5

</div>

</td>

<td style="color:black;background-color:orange;">

<div>

0.057619197294116

</div>

</td>

<td style="color:black;background-color:orange;">

<div>

100008

</div>

</td>

<td style="color:black;background-color:orange;">

<div>

0

</div>

</td>

</tr>

<tr>

<td style="color:white;background-color:black;">

<div>

10

</div>

</td>

<td style="color:white;background-color:black;">

<div>

1

</div>

</td>

<td style="color:white;background-color:black;">

<div>

5

</div>

</td>

<td style="color:white;background-color:black;">

<div>

j

</div>

</td>

<td style="color:white;background-color:black;">

<div>

NA

</div>

</td>

<td style="color:white;background-color:black;">

<div>

0.492289293091744

</div>

</td>

<td style="color:white;background-color:black;">

<div>

100009

</div>

</td>

<td style="color:white;background-color:black;">

<div>

0.11

</div>

</td>

</tr>

</tbody>

</table>

Other row and header styles:

``` r
ht$clear_styles()
ht$row_bg_color(1, "red")
ht$row_color(2, "blue")
ht$row_bold(3)
ht$row_italic(4)

ht$header_bg_color("black")
ht$header_italic()
ht$header_color("white")
ht$Rmd()
```

<table style="margin-left:auto;margin-right:auto;">

<thead>

<tr>

<th style="background-color:black;font-style:italic;color:white;">

<div>

A

</div>

</th>

<th style="background-color:black;font-style:italic;color:white;">

<div>

B

</div>

</th>

<th style="background-color:black;font-style:italic;color:white;">

<div>

C

</div>

</th>

<th style="background-color:black;font-style:italic;color:white;">

<div>

D

</div>

</th>

<th style="background-color:black;font-style:italic;color:white;">

<div>

E

</div>

</th>

<th style="background-color:black;font-style:italic;color:white;">

<div>

Pct

</div>

</th>

<th style="background-color:black;font-style:italic;color:white;">

<div>

Big

</div>

</th>

<th style="background-color:black;font-style:italic;color:white;">

<div>

Money

</div>

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="background-color:red;">

<div>

1

</div>

</td>

<td style="background-color:red;">

<div>

10

</div>

</td>

<td style="background-color:red;">

<div>

\-4

</div>

</td>

<td style="background-color:red;">

<div>

a

</div>

</td>

<td style="background-color:red;">

<div>

1

</div>

</td>

<td style="background-color:red;">

<div>

0.127570638665929

</div>

</td>

<td style="background-color:red;">

<div>

100000

</div>

</td>

<td style="background-color:red;">

<div>

100

</div>

</td>

</tr>

<tr>

<td style="color:blue;">

<div>

2

</div>

</td>

<td style="color:blue;">

<div>

9

</div>

</td>

<td style="color:blue;">

<div>

\-3

</div>

</td>

<td style="color:blue;">

<div>

b

</div>

</td>

<td style="color:blue;">

<div>

NA

</div>

</td>

<td style="color:blue;">

<div>

0.323635782115161

</div>

</td>

<td style="color:blue;">

<div>

100001

</div>

</td>

<td style="color:blue;">

<div>

200

</div>

</td>

</tr>

<tr>

<td style="font-weight:bold;">

<div>

3

</div>

</td>

<td style="font-weight:bold;">

<div>

8

</div>

</td>

<td style="font-weight:bold;">

<div>

\-2

</div>

</td>

<td style="font-weight:bold;">

<div>

c

</div>

</td>

<td style="font-weight:bold;">

<div>

2

</div>

</td>

<td style="font-weight:bold;">

<div>

0.481478109257296

</div>

</td>

<td style="font-weight:bold;">

<div>

100002

</div>

</td>

<td style="font-weight:bold;">

<div>

\-100

</div>

</td>

</tr>

<tr>

<td style="font-style:italic;">

<div>

4

</div>

</td>

<td style="font-style:italic;">

<div>

7

</div>

</td>

<td style="font-style:italic;">

<div>

\-1

</div>

</td>

<td style="font-style:italic;">

<div>

d

</div>

</td>

<td style="font-style:italic;">

<div>

NA

</div>

</td>

<td style="font-style:italic;">

<div>

0.148341480176896

</div>

</td>

<td style="font-style:italic;">

<div>

100003

</div>

</td>

<td style="font-style:italic;">

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

0.167925755726174

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

0.305551076540723

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

0.857581724179909

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

0.00823652977123857

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

0.057619197294116

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

0.492289293091744

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

### Style cell

Can target an individual cell as well. All available cell styles start
with the prefix “cell\_”.

``` r
ht$clear_styles()
ht$cell_add_style(1, 1, "background-color:blue;font-weight:bold;color:white;")
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

<td style="background-color:blue;font-weight:bold;color:white;">

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

0.127570638665929

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

0.323635782115161

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

0.481478109257296

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

0.148341480176896

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

0.167925755726174

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

0.305551076540723

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

0.857581724179909

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

0.00823652977123857

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

0.057619197294116

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

0.492289293091744

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

### Final table

This demonstrates a typical construction of a final table.

``` r
ht$clear_styles()

# pleasant overall styles
ht$add_styles("padding:10px;font-size:14px;font-family:arial")
ht$table_style_add("border-collapse:collapse;")
ht$tr_styles_all_add("border-bottom:solid #A9A9A9;border-width:1px 0;")
ht$tr_styles_which_add(1, "border-width:3px 0;")
ht$tr_styles_which_add(length(ht$tr_styles), "border:none;")

# edit the contents
ht$col_pct_fmt(6)
ht$col_comma_fmt(7)
ht$col_dollar_fmt(8)

ht$col_data_bar(1, "steelblue") # specify a color for bars
ht$col_color_scale(6:8) # use default colors
ht$Rmd()
```

<table style="margin-left:auto;margin-right:auto;border-collapse:collapse;">

<thead>

<tr style="border-bottom:solid #A9A9A9;border-width:3px 0;">

<th style="padding:10px;font-size:14px;font-family:arial;">

<div>

A

</div>

</th>

<th style="padding:10px;font-size:14px;font-family:arial;">

<div>

B

</div>

</th>

<th style="padding:10px;font-size:14px;font-family:arial;">

<div>

C

</div>

</th>

<th style="padding:10px;font-size:14px;font-family:arial;">

<div>

D

</div>

</th>

<th style="padding:10px;font-size:14px;font-family:arial;">

<div>

E

</div>

</th>

<th style="padding:10px;font-size:14px;font-family:arial;">

<div>

Pct

</div>

</th>

<th style="padding:10px;font-size:14px;font-family:arial;">

<div>

Big

</div>

</th>

<th style="padding:10px;font-size:14px;font-family:arial;">

<div>

Money

</div>

</th>

</tr>

</thead>

<tbody>

<tr style="border-bottom:solid #A9A9A9;border-width:1px 0;">

<td style="padding:10px;font-size:14px;font-family:arial;">

<div style="white-space:nowrap;direction:ltr;border-radius:4px;padding-right:2px;background-color:steelblue;width:10.00%;">

1

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div>

10

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div>

\-4

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div>

a

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div>

1

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div style="border-radius:0;padding-right:0;background-color:#8ECA7D;width:100%;">

12.76%

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div style="border-radius:0;padding-right:0;background-color:#63BE7B;width:100%;">

100,000

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div style="border-radius:0;padding-right:0;background-color:#FEE482;width:100%;">

$
100.00

</div>

</td>

</tr>

<tr style="border-bottom:solid #A9A9A9;border-width:1px 0;">

<td style="padding:10px;font-size:14px;font-family:arial;">

<div style="white-space:nowrap;direction:ltr;border-radius:4px;padding-right:2px;background-color:steelblue;width:20.00%;">

2

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div>

9

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div>

\-3

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div>

b

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div>

NA

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div style="border-radius:0;padding-right:0;background-color:#D6DF81;width:100%;">

32.36%

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div style="border-radius:0;padding-right:0;background-color:#85C87D;width:100%;">

100,001

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div style="border-radius:0;padding-right:0;background-color:#FEDE81;width:100%;">

$
200.00

</div>

</td>

</tr>

<tr style="border-bottom:solid #A9A9A9;border-width:1px 0;">

<td style="padding:10px;font-size:14px;font-family:arial;">

<div style="white-space:nowrap;direction:ltr;border-radius:4px;padding-right:2px;background-color:steelblue;width:30.00%;">

3

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div>

8

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div>

\-2

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div>

c

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div>

2

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div style="border-radius:0;padding-right:0;background-color:#FEDC81;width:100%;">

48.15%

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div style="border-radius:0;padding-right:0;background-color:#A8D27F;width:100%;">

100,002

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div style="border-radius:0;padding-right:0;background-color:#F7E883;width:100%;">

$
-100.00

</div>

</td>

</tr>

<tr style="border-bottom:solid #A9A9A9;border-width:1px 0;">

<td style="padding:10px;font-size:14px;font-family:arial;">

<div style="white-space:nowrap;direction:ltr;border-radius:4px;padding-right:2px;background-color:steelblue;width:40.00%;">

4

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div>

7

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div>

\-1

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div>

d

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div>

NA

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div style="border-radius:0;padding-right:0;background-color:#96CC7D;width:100%;">

14.83%

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div style="border-radius:0;padding-right:0;background-color:#CBDB81;width:100%;">

100,003

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div style="border-radius:0;padding-right:0;background-color:#EFE683;width:100%;">

$
-200.00

</div>

</td>

</tr>

<tr style="border-bottom:solid #A9A9A9;border-width:1px 0;">

<td style="padding:10px;font-size:14px;font-family:arial;">

<div style="white-space:nowrap;direction:ltr;border-radius:4px;padding-right:2px;background-color:steelblue;width:50.00%;">

5

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div>

6

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div>

0

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div>

e

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div>

3

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div style="border-radius:0;padding-right:0;background-color:#9DCE7E;width:100%;">

16.79%

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div style="border-radius:0;padding-right:0;background-color:#EDE583;width:100%;">

100,004

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div style="border-radius:0;padding-right:0;background-color:#FBAA77;width:100%;">

$
1,000.11

</div>

</td>

</tr>

<tr style="border-bottom:solid #A9A9A9;border-width:1px 0;">

<td style="padding:10px;font-size:14px;font-family:arial;">

<div style="white-space:nowrap;direction:ltr;border-radius:4px;padding-right:2px;background-color:steelblue;width:60.00%;">

6

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div>

5

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div>

1

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div>

f

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div>

NA

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div style="border-radius:0;padding-right:0;background-color:#D0DD81;width:100%;">

30.56%

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div style="border-radius:0;padding-right:0;background-color:#FEDC81;width:100%;">

100,005

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div style="border-radius:0;padding-right:0;background-color:#F8696B;width:100%;">

$
2,000.22

</div>

</td>

</tr>

<tr style="border-bottom:solid #A9A9A9;border-width:1px 0;">

<td style="padding:10px;font-size:14px;font-family:arial;">

<div style="white-space:nowrap;direction:ltr;border-radius:4px;padding-right:2px;background-color:steelblue;width:70.00%;">

7

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div>

4

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div>

2

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div>

g

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div>

4

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div style="border-radius:0;padding-right:0;background-color:#F8696B;width:100%;">

85.76%

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div style="border-radius:0;padding-right:0;background-color:#FCBF7B;width:100%;">

100,006

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div style="border-radius:0;padding-right:0;background-color:#B1D47F;width:100%;">

\(-1,000.11</div></td></tr><tr style='border-bottom:solid #A9A9A9;border-width:1px 0;'><td style='padding:10px;font-size:14px;font-family:arial;'><div style='white-space:nowrap;direction:ltr;border-radius:4px;padding-right:2px;background-color:steelblue;width:80.00%;'>8</div></td><td style='padding:10px;font-size:14px;font-family:arial;'><div>3</div></td><td style='padding:10px;font-size:14px;font-family:arial;'><div>3</div></td><td style='padding:10px;font-size:14px;font-family:arial;'><div>h</div></td><td style='padding:10px;font-size:14px;font-family:arial;'><div>NA</div></td><td style='padding:10px;font-size:14px;font-family:arial;'><div style='border-radius:0;padding-right:0;background-color:#63BE7B;width:100%;'>0.82%</div></td><td style='padding:10px;font-size:14px;font-family:arial;'><div style='border-radius:0;padding-right:0;background-color:#FBA276;width:100%;'>100,007</div></td><td style='padding:10px;font-size:14px;font-family:arial;'><div style='border-radius:0;padding-right:0;background-color:#63BE7B;width:100%;'>\)-2,000.22

</div>

</td>

</tr>

<tr style="border-bottom:solid #A9A9A9;border-width:1px 0;">

<td style="padding:10px;font-size:14px;font-family:arial;">

<div style="white-space:nowrap;direction:ltr;border-radius:4px;padding-right:2px;background-color:steelblue;width:90.00%;">

9

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div>

2

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div>

4

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div>

i

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div>

5

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div style="border-radius:0;padding-right:0;background-color:#75C37C;width:100%;">

5.76%

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div style="border-radius:0;padding-right:0;background-color:#F98570;width:100%;">

100,008

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div style="border-radius:0;padding-right:0;background-color:#FFEB84;width:100%;">

$
0.00

</div>

</td>

</tr>

<tr style="border-bottom:solid #A9A9A9;border-width:1px 0;border:none;">

<td style="padding:10px;font-size:14px;font-family:arial;">

<div style="white-space:nowrap;direction:ltr;border-radius:4px;padding-right:2px;background-color:steelblue;width:100.00%;">

10

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div>

1

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div>

5

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div>

j

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div>

NA

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div style="border-radius:0;padding-right:0;background-color:#FED880;width:100%;">

49.23%

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div style="border-radius:0;padding-right:0;background-color:#F8696B;width:100%;">

100,009

</div>

</td>

<td style="padding:10px;font-size:14px;font-family:arial;">

<div style="border-radius:0;padding-right:0;background-color:#FEEA83;width:100%;">

$ 0.11

</div>

</td>

</tr>

</tbody>

</table>
