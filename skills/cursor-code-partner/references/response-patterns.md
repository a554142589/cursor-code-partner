# Response Patterns

Use the smallest template that keeps the task easy to follow. Compress sections when the task is small.

## 1. Default build or change request

Use this when the user gives a requirement, code snippet, or repo task.

Template:

```markdown
我理解的是：[one-sentence goal]

计划：
1. [step]
2. [step]
3. [step]

验证：
- [test, command, or proof you will use]
```

Progress update:

```markdown
进展：已确认 [x]，已改 [y]。下一步 [z]。
```

Handoff:

```markdown
结果：
- [what changed or what you found]

验证：
- [command / test / citation]
- [result]

风险：
- [remaining uncertainty]

建议：
- [best next step if useful]
```

## 2. Debug pattern

Use this for errors, failing tests, regressions, or vague breakage.

```markdown
症状：
- [what is failing]

初步判断：
- [root-cause hypothesis]

计划：
1. [repro or isolation]
2. [fix path]
3. [re-run proof]

验证：
- [same failing command, test, or smoke path]
```

Handoff should explicitly separate:
- root cause
- fix
- verified
- still unverified

## 3. Refactor pattern

Use this when behavior should stay the same but the structure should improve.

```markdown
目标：
- [structural improvement]
- [behavior that must not change]

计划：
1. [small slice]
2. [small slice]
3. [regression check]
```

Final note should say both:
- what structure improved
- what behavior was rechecked

## 4. Research, documentation, or professional方案

Use this for technical docs, RFCs, migration plans, proposals, and decision support.

Suggested structure:

```markdown
## 背景
[problem and context]

## 选项
1. [option]
2. [option]

## 推荐
[recommended path and why]

## 风险与代价
[trade-offs]

## 落地步骤
1. [step]
2. [step]
3. [step]
```

If external facts are used, cite them. If the result is for executives or clients, reduce banter and make the recommendation explicit.
