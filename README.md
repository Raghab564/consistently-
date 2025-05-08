# Consistently 🌿

A habit-tracking app with live updates, streak tracking, anonymous confessions, and book recommendations.

---

## ✨ Features

✅ User authentication (Devise or custom)  
✅ Habit tracker (`Consistently`)    
✅ Mark habits as "done" for today or past days  
✅ Calendar-like UI showing done/missed days  
✅ Current streak, longest streak, consistency percentage  
✅ Weekly email summaries (Sidekiq + ActionMailer)  
✅ Live updates using Hotwire / Turbo


## Prerequisites

Before you begin, ensure you have the following software installed on your local machine:

- **Ruby** (version 3.x or higher)
- **Rails** (version 8.x or higher)
- **Node.js** (for Yarn)
- **Yarn** (for managing frontend dependencies)
- **SQLite3** 
  
You can install the necessary tools using the following commands:

### Installing Ruby
If you don't have Ruby installed, you can install it via **rbenv** or **rvm**. Here’s an example using **rbenv**:

```bash
brew install rbenv
rbenv install 3.2.0  
rbenv global 3.2.0

### Installing Rails
gem install rails -v 8.0.2

##Installing Node.js and Yarn
brew install node
brew install yarn

##Setup Instructions
git clone https://github.com/yourusername/project-name.git
cd consistently
 ##Install Ruby Dependencies
 bundle install
##Run Migrations
rails db:migrate
##Precompile Assets (Optional)
rails assets:precompile
##Start the Rails Server
You can start the Rails server with:

rails server
The application should now be accessible at http://localhost:3000.
