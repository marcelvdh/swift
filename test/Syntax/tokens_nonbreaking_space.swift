// RUN: cat %s | sed -e 's/'$(echo -ne "\x5a")'/'$(echo -ne "\xc2\xa0")'/g' > %t.tmp
// RUN: cp -f %t.tmp %t
// RUN: %swift-syntax-test -input-source-filename %t -dump-full-tokens 2>&1 | %FileCheck %t
let a =Z3Z // nbsp(Z)
func b() {}

// CHECK: 4:8: warning: non-breaking space (U+00A0) used instead of regular space
// CHECK: 4:11: warning: non-breaking space (U+00A0) used instead of regular space

// CHECK-LABEL: 4:7
// CHECK-NEXT:(Token equal
// CHECK-NEXT: (text="=")
// CHECK-NEXT: (trivia garbageText \302\240))

// CHECK-LABEL: 4:10
// CHECK-NEXT:(Token integer_literal
// CHECK-NEXT: (text="3")
// CHECK-NEXT: (trivia garbageText \302\240)
// CHECK-NEXT: (trivia space 1))

// CHECK-LABEL: 5:1
// CHECK-NEXT:(Token kw_func
// CHECK-NEXT: (trivia lineComment // nbsp(\302\240))
// CHECK-NEXT: (trivia newline 1)
// CHECK-NEXT: (text="func")
// CHECK-NEXT: (trivia space 1))
