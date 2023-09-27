# Translating protein-coding genes

*Protein-coding genes* are genes that cells first translate into RNA, then translate the RNA into amino acids, and finally use the amino acids as proteins that do whatever it is that proteins do.

We will not worry about the first step, from DNA to RNA. It is a straightforward process since each DNA nucleotide is translated to a corresponding RNA nucleotide, and we will skip it and instead translate directly from a DNA sequence to an amino acid sequence. If you can handle that, you can certainly also handle translating DNA into RNA. We will also add some simplifying assumptions to the project, and assume that a gene is a simple sequence of DNA, starting with the first code for an amino acid and ending at the last. This is close to how bacteria encode genes, but simpler than eukaryotic genes — we don’t want to go there this early in our programming career.

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

## Template code

The `codons.py` file contains the table of codons to amino acid translations shown above and three functions (ignore the `main.py` file for now). The first function, `split_codons()` splits a string of nucelotides into codons (triplets), the second, `translate_codons()` takes a list of these triplets and translate them into amino acids, and the last function, `translate_dna()` should translate all the way from a DNA sequence to an amino acid sequence. The last function can obviously use the first to achieve its goal, but you are free to implement it any way you want, as long as it can translate DNA strings to amino acids.

The task in this project is to implement the three functions in `codons.py`.

- [ ] Implement the `split_codons()` function according to the specification.
- [ ] Implement the `translate_codons()` function according to the specification.
- [ ] Implement the `translate_dna()` function according to the specification.

## Command-line tool

*OPTIONAL:*
Go through the cmdlinetool.md file and implement your program as a command-line tool as described there. 