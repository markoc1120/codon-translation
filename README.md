# Translating protein-coding genes

*Protein-coding genes* are genes that cells first translate into RNA, then translate the RNA into amino acids, and finally use the amino acids as proteins that do whatever it is that proteins do.

We will not worry about the first step, from DNA to RNA. It is a straightforward process since each DNA nucleotide is translated to a corresponding RNA nucleotide, and we will skip it and instead translate directly from a DNA sequence to an amino acid sequence. If you can handle that, you can certainly also handle translating DNA into RNA. We will also add some simplifying assumptions to the project, and assume that a gene is a simple sequence of DNA, starting with the first code for an amino acid and ending at the last. This is close to how bacteria encode genes, but simpler than eukaryotic genes—we don’t want to go there this early in our programming career.

So, a gene, with these simplifications, is a DNA sequence where each nucleotide takes part in coding an amino acid. The way that DNA encodes amino acids is, luckily, simple. Each triplet of DNA encodes one amino acid, with the mapping from triplets from the table below:

```python
CODON_MAP = {'TTT': 'F', 'TTC': 'F', 'TTA': 'L', 'TTG': 'L',
             'TCT': 'S', 'TCC': 'S', 'TCA': 'S', 'TCG': 'S', 
             'TAT': 'Y', 'TAC': 'Y', 'TAA': '*', 'TAG': '*', 
             'TGT': 'C', 'TGC': 'C', 'TGA': '*', 'TGG': 'W', 
             'CTT': 'L', 'CTC': 'L', 'CTA': 'L', 'CTG': 'L',
             'CCT': 'P', 'CCC': 'P', 'CCA': 'P', 'CCG': 'P', 
             'CAT': 'H', 'CAC': 'H', 'CAA': 'Q', 'CAG': 'Q', 
             'CGT': 'R', 'CGC': 'R', 'CGA': 'R', 'CGG': 'R', 
             'ATT': 'I', 'ATC': 'I', 'ATA': 'I', 'ATG': 'M', 
             'ACT': 'T', 'ACC': 'T', 'ACA': 'T', 'ACG': 'T', 
             'AAT': 'N', 'AAC': 'N', 'AAA': 'K', 'AAG': 'K', 
             'AGT': 'S', 'AGC': 'S', 'AGA': 'R', 'AGG': 'R', 
             'GTT': 'V', 'GTC': 'V', 'GTA': 'V', 'GTG': 'V', 
             'GCT': 'A', 'GCC': 'A', 'GCA': 'A', 'GCG': 'A', 
             'GAT': 'D', 'GAC': 'D', 'GAA': 'E', 'GAG': 'E', 
             'GGT': 'G', 'GGC': 'G', 'GGA': 'G', 'GGG': 'G'}
```

The table is close to universal for all life on Earth, with only tiny variation in some groups of species, so you rarely have to worry about other mappings.

So, if your DNA string is

```python
dna = "ATGACCGAACAGTAG"
```

consisting of triplets, 

```python
codons = ["ATG", "ACC", "GAA", "CAG", "TAG"]
```

you would expect to get the corresponding amino acids

```python
['M', 'T', 'E', 'Q', '*']
```

and you could build the following string from that:

```python
"MTEQ*"
```

## Setting up the template code

You sometimes need to install Python modules for use in your own programs. One way to do this is to use the `pip` tool distributed with Python. This tool can read the modules you need from a file and install them, including their dependencies. To do that, use the command

```sh
> python3 -m pip install -r requirements.txt
```

where `requirements.txt` contains the list of modules you want to install. There is an example `requirements.txt` in this repository that installs the `pytest` tool. Try installing it.

In the example `requirements.txt` we install a modules for testing code, `pytest`.

## Testing your code

We use two types of tests on projects in CTiB, `doctest` which is part of the standard Python library and `pytest` which we need to install. You can use them to test your code in your repository, but we also run tests every time you commit to GitHub, so we can keep track of your progress along the way.

The `doctest` module will validate if a function matches the behaviour we have described in its documentatiton string; if the documentation includes code that evaluates the function, `doctest` will test if it actually does what we claim.

You can run it on the included template code by running

```sh
> python3 -m doctest src/*.py
```

The `pytest` tool makes it easy for you to write so-called "unit tests"--small test functions that validates that different aspects of your code is working. It looks for Python files whose name starts with `test_`, and in them, it will locate all functions whose names start with `test_` and run them. There is already a test file in this repository, so you can try running `pytest` with the command

```sh
> python3 -m pytest src
```

Both tests will fail right now because there are tests to check if you have implemented the functions you need for this project, and for obvious reasons, you haven't done that yet. However, when you have implemented what you neeed to do, the tests will pass, and that will tell you that you have succeeded in your task.

Whenever you make changes to your code, you should run `doctest` and `pytest` to ensure that everything is still working. If you add new code, you can include documentation strings so `doctest` can keep you honest about the documentation. If you want more detailed testing, you can add another test, as a `test_*` function in an existing file or in a new `test_*.py` file.

When you push changes from your repository to GitHub, GitHub will also run tests on your code, and you can see the results in the `Feedback` pull request or in the `Actions` window on your repository.

## Template code

In the `src/` directory you can find two files, `codons.py` and `test_codons.py`. The first is where you should write your code for this project, and the second is where you should write tests. There are already some tests, to get you started, but you may want to add more, if you wish to test your code in more detail. That is entirely up to you.

The `codons.py` file contains the table of codons to amino acid translations shown above and three functions. The first function, `split_codons()` splits a string of nucelotides into codons (triplets), the second, `translate_codons()` takes a list of these triplets and translate them into amino acids, and the last function, `translate_dna()` should translate all the way from a DNA sequence to an amino acid sequence. The last function can obviously use the first to achieve its goal, but you are free to implement it any way you want, as long as it can translate DNA strings to amino acids.

The task in this project is to implement the three functions in `codons.py`.
