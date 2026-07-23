theme_paper <- theme_classic(base_family = "Arial") +
  theme(
    axis.title = element_text(size = 8, colour = "black", face = "plain"),
    axis.text  = element_text(size = 7, colour = "black", face = "plain"),
    strip.text = element_text(size = 7, colour = "black", face = "plain"),
    legend.text = element_text(size = 7, colour = "black"),
    legend.title = element_text(size = 7, colour = "black"),
    axis.line = element_line(linewidth = 0.35, colour = "black"),
    axis.ticks = element_line(linewidth = 0.3, colour = "black"),
    axis.ticks.length = unit(1.5, "pt"),
    strip.background = element_blank(),
    plot.title = element_text(size = 8, face = "plain", hjust = 0.5, margin = margin(b = 4))
  )

geom_point_paper <- geom_point(
  shape = 21,
  color = "black",
  stroke = 0.25,
  size = 1.8,
  alpha = 0.9,
  position = position_jitter(width = 0.11, height = 0)
)

geom_quasirandom_paper <- ggbeeswarm::geom_quasirandom(
  shape = 21,
  color = "black",
  width = .1,
  stroke = 0.25)

theme_rank_freq <- list(
  #geom_line(alpha = .7, linewidth = .4),
  ggplot2::scale_x_log10(),
  ggplot2::scale_y_log10(labels = scales::trans_format("log10", scales::math_format(10^.x)),
                         breaks = scales::trans_breaks("log10", function(x) 10^x, n = 3)),
  ggplot2::theme(aspect.ratio = 1),
  ggplot2::xlab("Expansion rank"),
  ggplot2::ylab("Clonal frequency")
)

plot_rank_freq <- list(
  geom_line(alpha = .7, linewidth = .4),
  scale_x_log10(),
  scale_y_log10(labels = trans_format("log10", math_format(10^.x)),
                breaks = trans_breaks("log10", function(x) 10^x, n = 5)),
  theme_classic(),
  theme(aspect.ratio = 1),
  theme(legend.position = c(.8, .9),
        aspect.ratio = 1,
        legend.background = element_rect(fill = "white", color = NA),
        legend.key = element_blank(),
        legend.title = element_blank(),
        legend.margin     = margin(1, 1, 1, 1),        # top, right, bottom, left (in pts)
        legend.box.margin = margin(0, 0, 0, 0),
        legend.key.height = unit(0.6, "lines"),     # reduce legend line height
        legend.spacing.y = unit(0, "lines"),
        plot.title = element_text(size = 9, hjust = 0.5),
        axis.title = element_text(size = 8),
        axis.text = element_text(size = 7),
        legend.text = element_text(size = 7)),
  xlab("Expansion rank"),
  ylab("Clonal frequency")
)

theme_legend <- theme(
  legend.position = "bottom",
  legend.title = element_blank(),
  legend.key.size = unit(3, "mm"),
  legend.spacing.x = unit(2, "mm"),
  legend.box.spacing = unit(0, "pt"),
  legend.margin = margin(t = -3, b = 0),
  plot.margin = margin(2, 2, 2, 2)
)

socs1_label <- function(x) {ifelse(x == "SOCS1-KO", "SOCS1ᴷᴼ", x)}

add_median <- ggplot2::stat_summary(fun = "median", geom = "crossbar", width = 0.5, color = "black", linewidth = .2)

p_math <- function(p, digits = 1) {
  vapply(p, function(x) {
    if (is.na(x)) return("plain(p) == NA")
    if (x <= 0) return("plain(p) < 10^{-300}")
    
    exponent <- floor(log10(x))
    coefficient <- signif(x / 10^exponent, digits)
    
    if (coefficient == 1) {
      sprintf("plain(p) == 10^{%d}", exponent)
    } else {
      sprintf(
        "plain(p) == %s %%*%% 10^{%d}",
        coefficient, exponent
      )
    }
  }, character(1))
}

mouse_type_colors <- c("WT" = "#1F77B4", "WT-in-SOCS1" = "#56B4E9", "SOCS1-KO" = "#D62728") # "#86B6D9"  "#8FBCE6" "#56B4E9"

mouse_type_labels <- function(x) {
  labels <- c("WT" = "'WT'", "WT-in-SOCS1" = "'WT-in-SOCS1'", "SOCS1-KO"    = "SOCS1^{KO}")
  parse(text = unname(labels[x]))
}

scale_fill_mouse_type <- function(...) {
  scale_fill_manual(
    values = mouse_type_colors,
    breaks = function(x) intersect(names(mouse_type_colors), x),
    labels = mouse_type_labels,
    drop = TRUE,
    ...
  )
}