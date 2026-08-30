data <- read.csv("result.csv", stringsAsFactors = FALSE)
counts <- as.data.frame(
  table(
    data$prover,
    data$type_encoding,
    data$language,
    data$verification_result
  )
)
names(counts) <- c(
  "prover",
  "type_encoding",
  "language",
  "verification_result",
  "count"
)
counts <- counts[counts$count > 0, ]
counts <- counts[order(
  counts$prover,
  counts$type_encoding,
  counts$language,
  counts$verification_result
), ]
print(counts)

#     prover type_encoding language          verification_result count
# 33 vampire     arguments   smtlib       VERIFICATION_TIMED_OUT   426
# 49 vampire     arguments   smtlib                     VERIFIED   351
# 41 vampire     arguments     tptp       VERIFICATION_TIMED_OUT   515
# 57 vampire     arguments     tptp                     VERIFIED   262
# 35 vampire   monomorphic   smtlib       VERIFICATION_TIMED_OUT   400
# 51 vampire   monomorphic   smtlib                     VERIFIED   377
# 43 vampire   monomorphic     tptp       VERIFICATION_TIMED_OUT   497
# 59 vampire   monomorphic     tptp                     VERIFIED   280
# 45 vampire   polymorphic     tptp       VERIFICATION_TIMED_OUT   487
# 61 vampire   polymorphic     tptp                     VERIFIED   290
# 39 vampire    predicates   smtlib       VERIFICATION_TIMED_OUT   548
# 55 vampire    predicates   smtlib                     VERIFIED   229
# 47 vampire    predicates     tptp       VERIFICATION_TIMED_OUT   569
# 63 vampire    predicates     tptp                     VERIFIED   208
# 2       z3     arguments   smtlib                 NOT_VERIFIED    24
# 18      z3     arguments   smtlib VERIFICATION_OUT_OF_RESOURCE     1
# 34      z3     arguments   smtlib       VERIFICATION_TIMED_OUT    19
# 50      z3     arguments   smtlib                     VERIFIED   733
# 4       z3   monomorphic   smtlib                 NOT_VERIFIED    25
# 20      z3   monomorphic   smtlib VERIFICATION_OUT_OF_RESOURCE     1
# 36      z3   monomorphic   smtlib       VERIFICATION_TIMED_OUT    21
# 52      z3   monomorphic   smtlib                     VERIFIED   730
# 8       z3    predicates   smtlib                 NOT_VERIFIED    46
# 24      z3    predicates   smtlib VERIFICATION_OUT_OF_RESOURCE     1
# 40      z3    predicates   smtlib       VERIFICATION_TIMED_OUT    17
# 56      z3    predicates   smtlib                     VERIFIED   713

