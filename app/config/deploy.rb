require 'capistrano/recipes/deploy/strategy/remote_cache'
require 'capistrano/ext/multistage'
require 'capistrano_colors'
require 'bundler/capistrano'

set :application, "set your application name here"
set :repository,  "set your repository location here"

set :scm, :git
set :repository, "git://github.com/cesare/kanitama.git"
set :deploy_subdir, "app"

set :stages, %w(infrapp)


class RemoteCacheSubdir < Capistrano::Deploy::Strategy::RemoteCache
  private
  def repository_cache_subdir
    if configuration[:deploy_subdir] then
      File.join(repository_cache, configuration[:deploy_subdir])
    else
      repository_cache
    end
  end

  def copy_repository_cache
    logger.trace "copying the cached version to #{configuration[:release_path]}"
    if copy_exclude.empty?
      run "cp -RpL #{repository_cache_subdir} #{configuration[:release_path]} && #{mark}"
    else
      exclusions = copy_exclude.map { |e| "--exclude=\"#{e}\"" }.join(' ')
      run "rsync -lrpt #{exclusions} #{repository_cache_subdir}/* #{configuration[:release_path]} && #{mark}"
    end
  end
end

set :strategy, RemoteCacheSubdir.new(self)
