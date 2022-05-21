md"""

A *primitive* Pythagorean triple (or **PPT** for short)

This notebook is built using Pluto Markdown[^1].

A *primitive* Pythagorean triple is as follows


$a^2 + b^2 = c^2$

where $a$ and $c$ are, odd and $a,b,c$ have no factors

$a^2  = c^2 + b^2$

$a^2  = (c + b)(c-b)$

we know from the first few PPT that $(c + b)$ and $(c-b)$ are squares. This can be proved as follows:

First suppose that $(c + b)$ and $(c-b)$ have a common divisor $d$. This means that d also divides

$(c + b) + (c-b) = 2c$

and $2b$. This means that the common divisor are $1$ or $2$, but we know that a is add and $a^2  = (c + b)(c-b)$, so the only divisor is $1$. This mean that both $(c + b)$ and $(c-b)$ most both be squares:

$(c + b) =  s^2$ and

$(c - b) =  t^2$ Substituting this back into the orginal formala we get

$b = \frac{s - t}{2} \text{, } c = \frac{s + t}{2}\text{, } a = st$


[^1]: https://docs.julialang.org/en/v1/stdlib/Markdown/
[^2]: https://www.youtube.com/watch?v=NaL_Cb42WyY
[^3]: https://en.wikibooks.org/wiki/LaTeX/Mathematics
[^4]: https://en.wikipedia.org/wiki/Table_of_Gaussian_integer_factorizations
[^5]: https://stackoverflow.com/questions/2269810/whats-a-nice-method-to-factor-gaussian-integers