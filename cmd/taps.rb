# typed: strict
# frozen_string_literal: true

require "abstract_command"
require "tap"

module Homebrew
  module Cmd
    class TapsCmd < AbstractCommand
      cmd_args do
        usage_banner "`taps` [--verbose]"
        description <<~EOS
          Print table of installed taps and tap details.

          Tap details:
            Tap: cannonical name of tap
            Size: output of `du -sh` for tap path
            🍺: Number of formulae available from tap
            🍷: Number of casks available from tap
            Cmd: Number of commands available from tap

          Extra data: symbols after final column indicate...
            `*` - tap has uncommitted changes
            `!` - tap is not a git repo, or has no `remote`/`origin`
            (foo) - tap is currently on branch "foo"
        EOS
      end

      def a(text, href, pad_to = 10)
        pad = [pad_to - text.size, 0].max
        "\033]8;;#{href}\007#{text}\033]8;;\007" + Array.new(pad, " ").join
      end

      def fmt_i(i)
        i.zero? ? "-" : i.to_s
      end

      def run
        taps = Tap.all
        name_col = taps.map(&:name).max_by(&:size).size
        fmt = "%s %4s %4s %4s %3s %s"
        puts "\033[1mTap\033[0m#{Array.new(name_col-3, " ").join} \033[1mSize\033[0m   🍺   🍷 \033[1mCmd\033[0m"

        taps.sort_by(&:name).each do |tap|
          extra = []

          if tap.installed?
            size = `du -sh #{tap.path}`.split.first
            extra << tap.path if args.verbose?

            if tap.remote
              dirty = `cd #{tap.path}; git status --porcelain`.strip
              extra << "\033[1m*\033[0m" unless dirty.strip.empty?
              extra << "(#{tap.git_repository.branch_name})" unless tap.git_repository.default_origin_branch?
            else
              extra << "\033[1m!\033[0m"
            end
          else
            size = "-"
          end

          puts sprintf fmt,
                       a(tap.name, tap.remote || "file:///#{tap.path}", name_col),
                       size,
                       fmt_i(tap.formula_files.size),
                       fmt_i(tap.cask_files.size),
                       fmt_i(tap.command_files.size),
                       extra.join(" ")
        end
      end
    end
  end
end
