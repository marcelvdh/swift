set(swiftDriver_sources
  Action.cpp
  Compilation.cpp
  DarwinToolChains.cpp
  SourceComparator.cpp
  Driver.cpp
  DriverIncrementalRanges.cpp
  FineGrainedDependencyDriverGraph.cpp
  FrontendUtil.cpp
  Job.cpp
  ParseableOutput.cpp
  PrettyStackTrace.cpp
  ToolChain.cpp
  ToolChains.cpp
  UnixToolChains.cpp
  WindowsToolChains.cpp
  WebAssemblyToolChains.cpp
  )

set(swiftDriver_targetDefines)

add_swift_host_library(swiftDriver STATIC
  ${swiftDriver_sources})
add_dependencies(swiftDriver
  SwiftOptions)
target_link_libraries(swiftDriver PRIVATE
  swiftAST
  swiftBasic
  swiftOption)
