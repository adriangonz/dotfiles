# Configuration file for ipython.

c = get_config()

# Enable autoreload
c.InteractiveShellApp.extensions = ['autoreload']
c.InteractiveShellApp.exec_lines = ['%autoreload 2']
