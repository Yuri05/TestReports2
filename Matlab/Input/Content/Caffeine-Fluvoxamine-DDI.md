The caffeine-fluvoxamine interaction was evaluated using clinical DDI studies listed in [Table 3](#table-3).

| **Source**                        | **Route** | **Dose [mg] /** **Schedule \***                            | **Pop.** | Age [yrs] (mean) | Weight [kg] (mean) | **Sex** | **N** | **Form.** |
| --------------------------------- | --------- | ---------------------------------------------------------- | -------- | ---------------- | ------------------ | ------- | ----- | --------- |
| [Jeppesen 1996](#5-references)    | p.o.      | 200 caffeine,<br />50 mg 4 days, 100 mg 8 days fluvoxamine | HV       | 27               | -                  | -       | 8     | Tablet    |
| [Culm-Merdek 2005](#5-references) | p.o.      | 250 caffeine,<br />100 b.i.d. fluvoxamine                  | HV       | 50               | 82                 | m/f     | 7     | Capsule   |

**Table 3:**<a name="table-3"></a> Literature sources of clinical concentration data of caffeine used for DDI prediction qualification with fluvoxamine.

A dynamical DDI simulation with fluvoxamine as CYP1A2 inhibitor and caffeine as victim was conducted and compared to literature data. For caffeine the template model included in PK-Sim was used. Two published clinical studies were found where fluvoxamine and caffeine were given together. Fluvoxamine is a strong inhibitor of CYP1A2 and increases the AUC of caffeine by 7 to 14-fold.

In [Jeppesen 1996](#5-references), subjects in one group received 50 mg fluvoxamine-maleate on the first 4 days followed by 100 mg q.d. for 8 days. On day 8 they received a single dose of 200 mg caffeine. The other group received caffeine without fluvoxamine co-treatment.

In [Culm-Merdek 2005](#5-references), seven healthy subjects received single 250 mg dose of caffeine (or matching placebo) together with fluvoxamine (four doses of 100 mg over 2 days) or with matching placebo in a cross-over fashion. 

The simulated caffeine levels with co-administered fluvoxamine were underpredicted. However, the pre-dose concentrations of caffeine were not 0 in the test group. It may be speculated that subjects may not have refrained completely from caffeine containing beverages before the test period. To investigate this hypothesis, a simulation was conducted where a dose of 100 mg caffeine (corresponding approximately to the caffeine content of one cup of coffee ([Caffeine quantities, FDA](#5-references))) was given 24 hours before the administration of caffeine-tablets as per the study protocol. The resulting simulation results support this hypothesis. Hence it was not deemed necessary to adjust the underlying caffeine or fluvoxamine models but rather conclude that the clinical study potentially was facing issues with subjects not compliant with the protocol rules and drank coffee the morning before the study day. The final DDI simulations were therefore conducted with administration of 100 mg caffeine 24 hours prior study protocol.