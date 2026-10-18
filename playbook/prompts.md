# Red-Team Prompts

The funnel sharpens the plan. These try to break it. Run them in the same conversation, about half an hour.
Write every answer back into `marketing-doc.md` §7. A spec that names its own failure modes is worth more than one that only argues for itself.

## Part A — Attack the document

### 1. Run the pre-mortem
> It's 18 months from now and this project is dead. Write the post-mortem.

Follow-up:
> Which of these causes could I test in the next 30 days? Rank them by how likely they are to be the real cause.

The fatal risk is usually the one you have been avoiding.

### 2. Name the load-bearing assumption
> List every assumption in this plan. Rank them by how much the plan depends on each and how little evidence I have for it.

Test the top of the list first, not the fun stuff.

### 3. Set the kill criteria first
> What result from this experiment should tell me to stop?

Deciding in advance removes the sunk-cost argument you'd otherwise have with yourself at 2am.

## Part B — Red-team the model that helped you

### 4. Argue with me
> Be the toughest buyer I will ever meet. What are your top three objections, ranked by which one kills the deal?

### 5. Second opinion on the second opinion
> Now critique the advice you just gave me. Where is it wrong, overconfident, or missing context?

A confident answer is not a validated one. Run the same question through a second model and compare.

### 6. Say what you don't know
> Ask me ten questions about this project that I should be able to answer but probably can't.

The gaps it exposes are your research list.

## Honest inputs
This works only with the real numbers and the real doubts. Hide them and you get advice about a project you aren't building.
