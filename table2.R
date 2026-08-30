data <- read.csv("result.csv", stringsAsFactors = FALSE)
verified <- data[data$verification_result == "VERIFIED", ]
verified_stats <- do.call(
  rbind,
  by(
    verified,
    list(
      verified$prover,
      verified$type_encoding,
      verified$language
    ),
    function(df) {
      data.frame(
        prover = df$prover[1],
        type_encoding = df$type_encoding[1],
        language = df$language[1],
        mean_elapsed_ms = mean(df$elapsed_ms, na.rm = TRUE),
        median_elapsed_ms = median(df$elapsed_ms, na.rm = TRUE),
        count = sum(!is.na(df$elapsed_ms))
      )
    }
  )
)
rownames(verified_stats) <- NULL
verified_stats <- verified_stats[order(
  verified_stats$prover,
  verified_stats$type_encoding,
  verified_stats$language
), ]
print(verified_stats)

#     prover type_encoding language mean_elapsed_ms median_elapsed_ms count
# 1  vampire     arguments   smtlib        2745.886            2074.0   351
# 7  vampire     arguments     tptp        2688.027            1633.0   262
# 3  vampire   monomorphic   smtlib        2928.164            2297.0   377
# 8  vampire   monomorphic     tptp        2572.657            1756.5   280
# 9  vampire   polymorphic     tptp        2591.259            1633.5   290
# 5  vampire    predicates   smtlib        2472.231            1507.0   229
# 10 vampire    predicates     tptp        2386.851            1534.5   208
# 2       z3     arguments   smtlib        1743.955            1518.0   733
# 4       z3   monomorphic   smtlib        1848.852            1585.0   730
# 6       z3    predicates   smtlib        1715.495            1535.0   713

