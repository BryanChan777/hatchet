require 'test_helper'

class ConfigTest < Test::Unit::TestCase

  def setup
    @config = Hatchet::Config.new
  end

  def test_config_path_for_name
    assert_equal 'test/fixtures/repos/rails3/codetriage', @config.path_for_name('codetriage')
  end

  def test_config_dirs
    expected_dirs = { "test/fixtures/repos/rails3/codetriage" => "git@github.com:sharpstone/codetriage.git",
                      "test/fixtures/repos/rails2/rails2blog" => "git@github.com:sharpstone/rails2blog.git" }
    assert_equal expected_dirs, @config.dirs
  end

  def test_config_repos
    expected_repos = { "codetriage" => "test/fixtures/repos/rails3/codetriage",
                       "rails2blog" => "test/fixtures/repos/rails2/rails2blog" }
    assert_equal expected_repos, @config.repos
  end

  def test_no_internal_config_raises_no_errors
    # assert no_raise
    @config.send :set_internal_config!, {}
    assert_equal './repos', @config.repo_directory_path
  end

  def test_github_shortcuts
    @config.send :init_config!, {"foo" => ["schneems/sextant"]}
    assert_equal("git@github.com:schneems/sextant.git", @config.dirs["./repos/foo/sextant"])
  end
end
