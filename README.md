Chef Boundary Annotations Handler
===

This is a Chef handler for taking successful changes and exceptions via Chef and creating Boundary Annotations from them.

Requirements
---

You will need your github [username and API token](https://github.com/settings/admin) as well as your Boundary [Organization ID and API Key](https://app.boundary.com/account). The contents of the Chef run will be posted to a [gist](https://gist.github.com/).

Setup
---

Append the following to your Chef client configs, usually at `/etc/chef/client.rb`

    # Create a Boundary Annotation when a Chef run fails

    # cacert.pem needs to be in the same directory as chef-boundary-annotations-handler
    require 'chef-boundary-annotations-handler'
    # require '/path/to/chef-boundary-annotations-handler'

    # github account information for creating a gist of the exception
    github_user = "foobar"
    github_token = "asdfadsf"

    # boundary account information for creating the annotation
    boundary_orgid = "v9dnd9dm"
    boundary_apikey = "cs3odm93nd"

    boundary_annotations = BoundaryAnnotations.new(boundary_orgid, boundary_apikey, github_user, github_token)

    # enable it as a exception handler
    exception_handlers << boundary_annotations

    # enable it as a report handler (only creates an annotation for changes)
    report_handlers << boundary_annotations

Or using the chef_handler LWRP

    include_recipe 'chef_handler'

    # install the chef-boundary-annotations-handler gem
    chef_gem 'chef-boundary-annotations-handler'

    # load the gem so it is in the LOAD_PATH ready for chef_handler
    require 'chef-boundary-annotations-handler'

    # Activate the chef_handler immediately during compile phase
    chef_handler 'chef-boundary-annotations-handler' do
      source 'chef-boundary-annotations-handler'
      arguments Mash.new(node["boundary"].to_hash).symbolize_keys
      action :enable
    end

To use the LWRP you will want to set the boundary attributes

    # boundary account info for creating the annotation
    node['boundary']['boundary_orgid']
    node['boundary']['boundary_apikey']

    # github account info for gist
    node['boundary']['github_user']
    node['boundary']['github_token']
