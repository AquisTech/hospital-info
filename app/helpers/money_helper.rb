module MoneyHelper
  def moneyfy(money)
    content_tag(:span, "#{money.currency.iso_code} #{humanized_money(money)}", title: money.currency.name)
  end
end