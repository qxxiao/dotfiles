return{
    cmd={ "/usr/lib/jvm/temurin-11-jdk-amd64/bin/java", "-Declipse.application=org.eclipse.jdt.ls.core.id1", "-Dosgi.bundles.defaultStartLevel=4", "-Declipse.product=org.eclipse.jdt.ls.core.product", "-Dlog.protocol=true", "-Dlog.level=ALL", "-Xms1g", "-Xmx2G", "--add-modules=ALL-SYSTEM", "--add-opens", "java.base/java.util=ALL-UNNAMED", "--add-opens", "java.base/java.lang=ALL-UNNAMED", "-jar", "/plugins/org.eclipse.equinox.launcher_*.jar", "-configuration", "config_linux", "-data", "/home/runner/workspace" },
    filetypes= {"java"},
    handlers={
        -- ["language/status"] = <function 1>,
        -- ["textDocument/codeAction"] = <function 2>,
        -- ["textDocument/rename"] = <function 3>,
        -- ["workspace/applyEdit"] = <function 4>
    },
    init_options={
        jvm_args = {},
        workspace = "/home/runner/workspace"
    },
    root_dir=  {
        -- Single-module projects
        {
          'build.xml', -- Ant
          'pom.xml', -- Maven
          'settings.gradle', -- Gradle
          'settings.gradle.kts', -- Gradle
        },
        -- Multi-module projects
        -- { 'build.gradle', 'build.gradle.kts' },
    }, -- vim.fn.getcwd()
    single_file_support=true,
}