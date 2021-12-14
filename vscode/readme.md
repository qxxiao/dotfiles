# vscode config files

1. [keybindings.json](./keybindings.json)  
键位配置
* 使用`ctrl+tab`切换编辑器页面
* 使用`tab`切换智能提示
* 使用`cmd+n`,`cmd+p`切换快速窗口quickOpen中（例如cmd+shift+p窗口）选项  

2. [settings.json](./settings.json)  
工作区的默认配置

* 添加固定的背景颜色（以免主题插件升级改变颜色）dracula soft
```json
"workbench.colorCustomizations": {
	...
	// 添加固定的面板颜色
    // "terminal.background": "#242424",
    "panel.background": "#242424",
    "contrastBorder": "#191A21",
    "editor.background": "#1e1e1e",
}
```

