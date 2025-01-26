import Lake
open Lake DSL

package «UW» where
  -- add package configuration options here

lean_lib «UW» where
  -- add library configuration options here

@[default_target]
lean_exe «UwLeanExe» where
  root := `UW
