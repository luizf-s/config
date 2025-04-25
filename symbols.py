import unicodedata

def listar_caracteres_matematicos(intervalo_unicode=(0x0000, 0xFFFF)):
  """
  Lista caracteres Unicode que são geralmente usados em notação matemática.

  Args:
      intervalo_unicode (tuple): Intervalo de pontos de código Unicode a serem verificados.
                                 O padrão é o BMP (Basic Multilingual Plane).

  Returns:
      list: Uma lista de tuplas contendo o caractere e seu nome Unicode.
  """
  caracteres_matematicos = []
  inicio, fim = intervalo_unicode

  for codepoint in range(inicio, fim + 1):
      char = chr(codepoint)
      try:
          nome = unicodedata.name(char)
          if "MATHEMATICAL" in nome or \
             "FRACTION" in nome or \
             "INFINITY" in nome or \
             "SUMMATION" in nome or \
             "INTEGRAL" in nome or \
             "PRODUCT" in nome or \
             "GREEK" in nome and "CAPITAL" not in nome and "SMALL" not in nome or \
             "NUMBER" in nome and "CIRCLED" not in nome and "SUPERSCRIPT" not in nome and "SUBSCRIPT" not in nome or \
             "PLUS" in nome or \
             "MINUS" in nome or \
             "EQUALS" in nome or \
             "DIVISION" in nome or \
             "MULTIPLICATION" in nome or \
             "SQUARE ROOT" in nome or \
             "ANGLE" in nome or \
             "DEGREE" in nome or \
             "PROPORTIONAL" in nome or \
             "INCREMENT" in nome or \
             "PARTIAL DIFFERENTIAL" in nome or \
             "EMPTY SET" in nome or \
             "ELEMENT OF" in nome or \
             "NOT AN ELEMENT OF" in nome or \
             "SUBSET OF" in nome or \
             "SUPERSET OF" in nome or \
             "UNION" in nome or \
             "INTERSECTION" in nome or \
             "LOGICAL" in nome:
              caracteres_matematicos.append((char, nome))
      except ValueError:
          # Ignora caracteres sem nome Unicode definido
          pass

  return caracteres_matematicos

def imprimir_caracteres(caracteres):
  """
  Imprime a lista de caracteres e seus nomes Unicode.

  Args:
      caracteres (list): Lista de tuplas (caractere, nome).
  """
  for char, nome in caracteres:
      print(f"{char}: {nome}")

if __name__ == "__main__":
  # Intervalo Unicode para o BMP (Basic Multilingual Plane)
  # intervalo = (0x0000, 0xFFFF)  # BMP

  simbolos_matematicos = [*listar_caracteres_matematicos((0x0000,  0xFFFF)),
                          *listar_caracteres_matematicos((0x1D400, 0x1D7FF))]
  imprimir_caracteres(simbolos_matematicos)
  print(f"\nTotal de caracteres matemáticos encontrados: {len(simbolos_matematicos)}")
