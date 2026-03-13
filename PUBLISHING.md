# Publishing guide

## 1. 建一个空仓库

建议仓库名直接叫：

```text
cursor-code-partner
```

## 2. 上传这份目录

如果你是本地上传：

```bash
cd cursor-code-partner
git init
git add .
git commit -m "feat: initial public release"
git branch -M main
git remote add origin git@github.com:<YOUR_GITHUB_USER>/<YOUR_REPO>.git
git push -u origin main
```

如果你用 GitHub Desktop 或网页上传也可以，目录结构别改乱就行。

## 3. 替换 README 里的占位符

全局替换下面两个字符串：

- `<YOUR_GITHUB_USER>`
- `<YOUR_REPO>`

如果你的仓库名就叫 `cursor-code-partner`，那第二个通常就是：

```text
cursor-code-partner
```

## 4. 打一个版本 tag

这个仓库内置了 GitHub Actions release workflow。打 tag 后会自动产出 release 资产。

```bash
git tag v0.1.0
git push origin v0.1.0
```

## 5. 检查 Release 页面

正常情况下你会在 GitHub Releases 里看到：

- `cursor-code-partner-cursor-pack.zip`
- `skill.zip`

## 6. 推荐的首屏安装方式

最像 `pua` 的安装方式，是把这条放进 README 最前面：

```bash
mkdir -p .cursor/rules
curl -fsSL https://raw.githubusercontent.com/<YOUR_GITHUB_USER>/<YOUR_REPO>/main/cursor/rules/cursor-code-partner.mdc \
  -o .cursor/rules/cursor-code-partner.mdc
```

这条最适合传播，因为用户不用先 clone。
