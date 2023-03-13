BlackStack::Extensions::add ({
    # descriptive name and descriptor
    :name => 'agency',
    :large_name => 'Warm Leads Program',

    # Write a description here. It will be shown in the main dashboard of your MySaaS project.
    :description => 'Email Campanigns Driven by Our Experts, and Full Managed Configurations.<br/>From 10 to 15 Positive Replies Per Month, Guaranteed.<br/>Weekly Follow-Ups to Interested Leads.',

    # setup the url of the repository for installation and updates
    :repo_url => 'https://github.com/leandrosardi/agency',
    :repo_branch => 'main',

    # define version with format <mayor>.<minor>.<revision>
    :version => '0.0.1',

    # define the name of the author
    :author => 'Leandro Daniel Sardi',

    # what is the section to add this extension in either the top-bar, the footer, the dashboard.
    :services_section => 'Services',
    # show this extension as a service in the top bar?
    :show_in_top_bar => true,
    # show this extension as a service in the footer?
    :show_in_footer => true,
    # show this extension as a service in the dashboard?
    :show_in_dashboard => true,

    :dependencies => [
        { :extension => :content, :version => '0.0.1' },
    ],

    # what are the screens to add in the leftbar
    :leftbar_icons => [
        { :label => 'dashboard', :icon => :chart, :screen => :dashboard, },
    ],
=begin
    # add a folder to the storage from where user can download the exports.
    :storage_folders => [
        { :name => 'leads.exports', },
    ],

    # deployment routines
    :deployment_routines => [{
        :name => 'install-gems',
        :commands => [{ 
            :command => "
                gem install --no-document google-api-client -v 0.53.0;
                gem install --no-document mail -v 2.7.1;
            ",
            :sudo => true,
    }, {
        :name => 'start-offline-processes',
        :commands => [{ 
            # back up old configuration file
            # setup new configuration file
            :command => "
                source /home/%ssh_username%/.rvm/scripts/rvm; rvm install 3.1.2; rvm --default use 3.1.2;
                cd /home/%ssh_username%/code/mysaas/extensions/leads/p; 
                export RUBYLIB=/home/%ssh_username%/code/mysaas;
                nohup ruby export.rb;
            ",
            :sudo => false,
            :background => true,
        }, {
            # back up old configuration file
            # setup new configuration file
            :command => "
                source /home/%ssh_username%/.rvm/scripts/rvm; rvm install 3.1.2; rvm --default use 3.1.2;
                cd /home/%ssh_username%/code/mysaas/extensions/leads/p; 
                export RUBYLIB=/home/%ssh_username%/code/mysaas;
                nohup ruby stat.search.rb;
            ",
            :sudo => false,
            :background => true,
        }],
    }],
=end
})

=begin
# setup the I2P product description here
BlackStack::I2P::add_services([
    { 
        :code=>'agency', 
        :name=>'Positive Replies from Leads', 
        :unit_name=>'warmlead', 
        :consumption=>BlackStack::I2P::CONSUMPTION_BY_TIME, 
        # formal description to show in the list of products
        :description=>'Liftetime access to our Cold Emails Seminar.',
        # persuasive description to show in the sales letter
        :title=>'Learn how book meetings and close deals with cold emails, at an affordable cost.',
        # larger persuasive description to show in the sales letter
        :summary=>'This seminar teaches you how to get quality email databases at very low price, how deliver cold emails for free, and how to write cold emails in order to get responses.',
        :thumbnail=>CS_HOME_WEBSITE+'/agency/images/logo.png',
        :return_path=>CS_HOME_WEBSITE+'/agency/dashboard',
        # what is the life time of this product or service?
        :credits_expiration_period => 'month',
        :credits_expiration_units => 1,
        # free tier configuration
        :free_tier=>{
            # add 10 records per month, for free
            :credits=>50,
            :period=>'month',
            :units=>1,
        },
        # most popular plan configuratioon
        :most_popular_plan => 'agency.batman',
    },
])
=end