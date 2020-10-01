# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
 Rails.application.config.assets.precompile += %w(  admin.js 
                                                    admin.css 
                                                    style.css
                                                    vendor.bundle.addons.css
                                                    vendor.bundle.base.css 
                                                    materialdesignicons.min.css
                                                    summernote-bs4.css
                                                    home/style.css
                                                    home/bootstrap.min.css
                                                    home/owl.carousel.min.css
                                                    home/slicknav.css 
                                                    home/flaticon.css
                                                    home/progressbar_barfiller.css
                                                    home/gijgo.css
                                                    home/animate.min.css
                                                    home/animated-headline.css
                                                    home/magnific-popup.css
                                                    home/fontawesome-all.min.css
                                                    home/themify-icons.css
                                                    home/slick.css
                                                    home/nice-select.css
                                                    )
