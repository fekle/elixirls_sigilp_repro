defmodule ElixirlsSigilpReproWeb.PageController do
  use ElixirlsSigilpReproWeb, :controller

  def home(conn, _params) do
    # SIGIL_P ISSUE - THIS DOES NOT WORK
    _sigil_p_issue_a = ~p"/sigil-p-issue?#{[issue: true]}"
    _sigil_p_issue_b = ~p"/sigil-p-issue?#{%{issue: true}}"
    _sigil_p_issue_c = ~p"/sigil-p-issue?issue=#{true}"
    # END SIGIL P ISSUE

    # The home page is often custom made,
    # so skip the default app layout.
    render(
      conn,
      :home,
      layout: false
    )
  end
end
