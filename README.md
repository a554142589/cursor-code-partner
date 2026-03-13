# Cursor Code Partner

一个给 **Cursor** 用的高执行力、验证优先、会沟通的搭子型规则包。

它不是靠“吓唬模型”推进，而是把这套节奏固化下来：

- 先拆解需求，再给短计划
- 边做边汇报，但不碎嘴
- 写代码、修 bug、重构、查资料、写文档、做方案都能接
- 结尾必须给验证结果、剩余风险、下一步建议
- 口语化、协作感强，但不尬聊、不装完成、不居高临下

一句话：**让 Cursor 更像一个靠谱、会干活、会汇报、会拿证据说话的搭子。**

## 适合谁

适合这些场景：

- 你不想让 AI 上来就闷头改，想先看短计划
- 你不想它修完就喊“好了”，想先看验证证据
- 你想要互动感，但又不想它一路废话直播
- 你做的不是只有写代码，还包括 debug、重构、文档、调研和专业方案

## 快速安装

### 方案 A：单文件安装（最像 pua，最省事）

适合想要“一条命令装上就用”的人。

macOS / Linux:

```bash
mkdir -p .cursor/rules
curl -fsSL https://raw.githubusercontent.com/a554142589/cursor-code-partner/main/cursor/rules/cursor-code-partner.mdc \
  -o .cursor/rules/cursor-code-partner.mdc
```

Windows PowerShell:

```powershell
New-Item -ItemType Directory -Force .cursor\rules | Out-Null
Invoke-WebRequest -Uri https://raw.githubusercontent.com/a554142589/cursor-code-partner/main/cursor/rules/cursor-code-partner.mdc `
  -OutFile .cursor\rules\cursor-code-partner.mdc
```

### 方案 B：完整包安装（推荐）

完整包会安装：

- `AGENTS.md`
- `.cursor/rules/00-core-behavior.mdc`
- `.cursor/rules/20-debug-and-verification.mdc`
- `.cursor/rules/30-build-refactor-plan.mdc`
- `.cursor/rules/40-research-docs-and-proposals.mdc`

macOS / Linux：

```bash
curl -fsSL https://raw.githubusercontent.com/<YOUR_GITHUB_USER>/<YOUR_REPO>/main/scripts/install.sh | \
  bash -s -- --base-url https://raw.githubusercontent.com/<YOUR_GITHUB_USER>/<YOUR_REPO>/main --target . --mode full
```

Windows PowerShell：

```powershell
Invoke-WebRequest -Uri https://raw.githubusercontent.com/<YOUR_GITHUB_USER>/<YOUR_REPO>/main/scripts/install.ps1 -OutFile install-cursor-code-partner.ps1
powershell -ExecutionPolicy Bypass -File .\install-cursor-code-partner.ps1 -BaseUrl https://raw.githubusercontent.com/<YOUR_GITHUB_USER>/<YOUR_REPO>/main -Target . -Mode full
```

### 方案 C：clone 后本地安装

```bash
git clone https://github.com/<YOUR_GITHUB_USER>/<YOUR_REPO>.git
bash <YOUR_REPO>/scripts/install.sh --target /path/to/project --mode full
```

## 仓库结构

```text
cursor-code-partner/
├── cursor/
│   ├── rules/
│   │   └── cursor-code-partner.mdc
│   └── pack/
│       ├── AGENTS.md
│       ├── USER_RULE.txt
│       ├── CUSTOM_MODE_SHIPMATE.md
│       └── .cursor/rules/*.mdc
├── skills/
│   └── cursor-code-partner/
├── scripts/
│   ├── install.sh
│   ├── install.ps1
│   └── build-artifacts.sh
└── .github/workflows/release.yml
```

## 这套规则会带来什么变化

### 默认工作节奏

1. 先用一两句话确认目标
2. 再给 2 到 5 步短计划
3. 执行时只做里程碑式更新
4. 收尾必须带验证结果
5. 明确区分：已验证 / 部分验证 / 未验证

### 沟通风格

- 像靠谱搭子，不像客服话术机
- 有互动感，但不频繁打断
- 有一点点幽默感，但不硬抖机灵
- 不装懂，不装完成，不端着说教

## 可选增强

- `cursor/pack/USER_RULE.txt`：适合放进 Cursor 的全局 User Rules
- `cursor/pack/CUSTOM_MODE_SHIPMATE.md`：适合做一个专门的 Custom Mode
- `skills/cursor-code-partner/`：仓库里也附带了标准 `SKILL.md` 版本，方便给兼容 Skill 的 agent 复用

## 发布自己的 GitHub 版本

把这个仓库上传到你自己的 GitHub 后，记得把 README 里的：

- `<YOUR_GITHUB_USER>`
- `<YOUR_REPO>`

替换成你的真实仓库地址。

更完整的发布步骤见 [`PUBLISHING.md`](PUBLISHING.md)。

## Release 资产

打 tag 后，GitHub Actions 会自动构建：

- `cursor-code-partner-cursor-pack.zip`
- `skill.zip`

## License

MIT
