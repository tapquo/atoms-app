Atoms.$ ->
  console.info "Atoms #{Atoms.version}", Atoms

  $(document.body).addClass "standalone" if navigator.standalone

  # ------------------------------------------------------------
  # URL
  # ------------------------------------------------------------
  # Atoms.Url.path "first", "form"
  # Atoms.Url.path "second", "main"
  # Atoms.Url.path "third", "second"
