local status_ok, impatient = pcall(require, "impatient")
if not status_ok then
    print(impatient)
  return
end

impatient.enable_profile()
