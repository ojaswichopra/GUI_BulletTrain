import matlab.engine

eng=matlab.engine.start_matlab()
script_folder = 'Sample/text'  # This gets the current folder
eng.cd(script_folder)
eng.main(nargout=0)
# op=eng.workspace['d']
# print(op)

eng.quit()