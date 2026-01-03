# VID for Engineering Managers

## Executive Summary

Verified Intent Development (VID) is a lightweight methodology for AI-augmented teams that treats verification—not generation—as the constraint. Managers adopt VID to keep AI productivity gains without trading away safety, compliance, or maintainability.

## Business Case

| Risk Without VID | VID Mitigation |
|------------------|----------------|
| Code volume grows faster than review capacity, causing incidents | Graduated Trust (Chapter 5) ensures effort matches risk via the rubric in Appendix D |
| Teams accept AI output they do not understand, creating fragile systems | Principle 3 + checklists (Appendix F) require documented understanding before acceptance |
| Unknown provenance complicates audits and licensing | Principle 4 + templates in `/templates` add provenance metadata to commits, PRs, and scripts |
| Verification time viewed as overhead, so it is skipped under pressure | Core practices (Chapters 9–12) operationalize verification rituals and learning loops |

## Adoption Roadmap

1. **Pilot (Weeks 1–4)**
   - Train a small squad on Chapters 1, 4–10, and Appendix D.
   - Require intent specs + basic verification checklists for their stories.
   - Track risk scores and verification notes in PRs.

2. **Team Rollout (Months 2–3)**
   - Standardize commit/PR templates from `/templates`.
   - Add risk score + verification sections to sprint reviews.
   - Run monthly calibration sessions using Appendix D & F checklists.

3. **Org Scaling (Months 4+)**
   - Integrate provenance hooks (templates/git-hooks) into default repo setup.
   - Include VID metrics on engineering scorecards.
   - Expand training tracks: junior curriculum (Chapter 13), senior guidance (Chapter 14), team culture (Chapter 15).

## Metrics That Matter

| Category | Suggested Metric | Data Source |
|----------|-----------------|-------------|
| **Verification Coverage** | % of merged PRs with documented risk score + verification steps | PR templates / CI check |
| **Incident Prevention** | # of issues caught during verification vs. post-release | Retro notes / issue tracker |
| **Provenance Hygiene** | % of commits tagging AI assistance + reviewer | Git hooks / audit scripts |
| **Calibration Health** | # of calibration sessions held + actions taken | Team ritual log |

## Management Checklist

- [ ] Communicate that verification time is part of definition of done.
- [ ] Require risk scoring for every change (Appendix D).
- [ ] Enforce provenance metadata (Chapter 7 + `/templates`).
- [ ] Schedule recurring learning-loop reviews (Chapter 11).
- [ ] Equip teams with decision trees (Appendix E) and checklists (Appendix F).

## Handling Objections

| Objection | Response |
|-----------|----------|
| “VID will slow us down.” | Verification prevents costly incidents and rework; Appendix D ensures only high-risk work gets deep scrutiny. |
| “AI output is already good.” | AI cannot guarantee correctness; chapters 4–6 show why intent + understanding are still required. |
| “We can’t track provenance at our scale.” | Chapter 12 outlines maturity levels plus ready-made hooks/scripts in `/templates/scripts`. |

## Further Reading for Managers

1. **Quick Orientation:** Preface + Chapters 1–3.
2. **Principles Toolbox:** Chapters 4–8.
3. **Team Playbooks:** Chapters 15–16.
4. **Artifacts:** Appendix D (risk), Appendix E (decision trees), Appendix F (checklists), `/templates` (automation).

*Adopting VID is a process change, not a tooling purchase. Set expectations, measure verification quality, and celebrate catches to build the culture that keeps AI acceleration safe.*
