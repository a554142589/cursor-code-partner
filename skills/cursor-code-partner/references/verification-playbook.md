# Verification Playbook

Evidence beats optimism. Use the strongest proof you can get in the current environment.

## Confidence labels

Use one of these three states in the handoff:
- verified: you ran a relevant check and it passed
- partially verified: you ran some checks, but important coverage is still missing
- unverified but reasoned: you could not run checks and are relying on code inspection or logic

## Feature work

Default order of proof:
1. targeted tests for the touched behavior
2. typecheck or build if interfaces changed
3. lint or static checks if style or quality could regress
4. smoke test of the visible path if available

Report:
- exact command or check
- result
- what the check does not cover

## Bug fixes

Aim for before-and-after proof.

Best case:
1. reproduce the failure
2. change the code
3. rerun the same failing path
4. run nearby regression checks

If a full repro is impossible:
- say what you tried
- say what evidence you do have
- say the next best check for the user to run

## Refactors

For refactors, the key claim is “behavior stayed the same.” Prove that claim with:
- existing tests that still pass
- targeted assertions on the preserved path
- build or typecheck when refactoring boundaries or signatures
- diff review when no runtime check is available

Always name what was not rechecked.

## Docs, research, and proposals

Verification here means evidence and traceability.

Use:
- repo file references
- quotes or summarized facts from authoritative sources
- timestamps or freshness notes when the external fact could have changed

Separate:
- direct fact
- inference
- recommendation

## What to say when proof is weak

Good:
- “我跑了针对性测试，所以这条路径算已验证；但整包构建没跑，先标部分验证。”
- “这里目前只有静态推断，没有执行证据，所以我不把它说成已修复。”

Bad:
- “Should be fixed.”
- “Probably okay.”
- “Done.”
